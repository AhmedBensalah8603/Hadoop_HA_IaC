#!/bin/bash

# Define nodes
NAME_NODE="NameNode"
DATA_NODES=("DataNode1" "DataNode2")

# Get the hostname of the current VM
HOSTNAME=$(hostname)

# On NameNode: Generate SSH key and place it in the shared folder
if [ "$HOSTNAME" == "$NAME_NODE" ]; then
    echo "Setting up SSH key on $NAME_NODE..."

    # Ensure .ssh directory exists for vagrant user and grant to it all previleges
    sudo -u vagrant mkdir -p /home/vagrant/.ssh
    sudo chmod 700 /home/vagrant/.ssh

    # Generate SSH key pair if not exists
    if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
        sudo -u vagrant ssh-keygen -t rsa -b 4096 -N "" -f /home/vagrant/.ssh/id_rsa
    fi

    # Copy public key to the shared folder
    # The default shared folder between vagrant nodes is: /vagrant
    cp /home/vagrant/.ssh/id_rsa.pub /vagrant/id_rsa.pub
    echo "Public key copied to shared folder."
fi

# On DataNodes: Retrieve the public key from the shared folder and append it to authorized_keys
if [[ " ${DATA_NODES[@]} " =~ " $HOSTNAME " ]]; then
    echo "Configuring passwordless SSH on $HOSTNAME..."

    # Ensure .ssh directory exists and grant to it all previleges
    mkdir -p /home/vagrant/.ssh
    chmod 700 /home/vagrant/.ssh

    # Wait until the public key appears in the shared folder (in case of provisioning order issues)
    while [ ! -f /vagrant/id_rsa.pub ]; do
        echo "Waiting for public key..."
        sleep 2
    done

    # Append the public key from the shared folder to authorized_keys
    cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

    # Set correct permissions
    chmod 600 /home/vagrant/.ssh/authorized_keys
    chown -R vagrant:vagrant /home/vagrant/.ssh
    echo "SSH key added for $HOSTNAME"
fi

