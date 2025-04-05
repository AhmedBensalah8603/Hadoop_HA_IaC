#!/bin/bash

echo "Installing Hadoop..."
if [ ! -f "hadoop-3.3.6.tar.gz" ]; then
    wget --no-check-certificate https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
    tar -xzf hadoop-3.3.6.tar.gz
    sudo mv hadoop-3.3.6 /usr/local/hadoop
fi
echo "Hadoop installed in /usr/local/hadoop"

INSTALL_DIR="/usr/local/hadoop"
echo "Configuring Hadoop environment variables..."
cat <<EOL >> ".bashrc"

### HADOOP
export HADOOP_HOME=$INSTALL_DIR
export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop
export HADOOP_MAPRED_HOME=\$HADOOP_HOME
export HADOOP_COMMON_HOME=\$HADOOP_HOME
export HADOOP_HDFS_HOME=\$HADOOP_HOME
export PATH=\$PATH:\$HADOOP_HOME/bin

EOL
echo "Hadoop environment variables added to .bashrc"

# Appliquer immédiatement les variables d'environnement
source "$HOME/.bashrc"

echo "Hadoop installation and environment setup completed!"


### ** Création du répertoire HDFS uniquement pour les nodes **
HOSTNAME=$(hostname)

if [[ "$HOSTNAME" == "NameNode" ]]; then
    echo "This is the NameNode. Checking NameNode directory..."
    HDFS_NAME_DIR="/usr/local/hadoop/hdfs/namenode"
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    chmod 700 ~/.ssh
    if [ ! -d "$HDFS_NAME_DIR" ]; then
        echo "Creating NameNode directory at $HDFS_NAME_DIR..."
        sudo mkdir -p "$HDFS_NAME_DIR"
        sudo chown -R vagrant:vagrant "$HDFS_NAME_DIR"
        echo "HDFS NameNode directory successfully created."
    else
        echo "HDFS NameNode directory already exists at $HDFS_NAME_DIR. Skipping creation."
    fi
    YARN_LOCAL_DIR="/usr/local/hadoop/yarn/local"
YARN_LOGS_DIR="/usr/local/hadoop/yarn/logs"

# Créer le répertoire /yarn/local si nécessaire
    if [ ! -d "$YARN_LOCAL_DIR" ]; then
    	echo "Creating YARN local directory at $YARN_LOCAL_DIR..."
    	sudo mkdir -p "$YARN_LOCAL_DIR"
    	sudo chown -R vagrant:vagrant "$YARN_LOCAL_DIR"
    	echo "YARN local directory successfully created."
    else
    	echo "YARN local directory already exists at $YARN_LOCAL_DIR. Skipping creation."
    fi

# Créer le répertoire /yarn/logs si nécessaire
    if [ ! -d "$YARN_LOGS_DIR" ]; then
    	echo "Creating YARN logs directory at $YARN_LOGS_DIR..."
    	sudo mkdir -p "$YARN_LOGS_DIR"
    	sudo chown -R vagrant:vagrant "$YARN_LOGS_DIR"
    	echo "YARN logs directory successfully created."
    else
    	echo "YARN logs directory already exists at $YARN_LOGS_DIR. Skipping creation."
    fi

elif [[ "$HOSTNAME" == "DataNode"* ]]; then
    sudo chown -R vagrant:vagrant /usr/local/hadoop
    mkdir -p /usr/local/hadoop/logs
    sudo chmod -R 755 /usr/local/hadoop
    echo "This is a DataNode. Checking DataNode directory..."
    HDFS_DATA_DIR="/usr/local/hadoop/hdfs/datanode"

    if [ ! -d "$HDFS_DATA_DIR" ]; then
        echo "Creating DataNode directory at $HDFS_DATA_DIR..."
        sudo mkdir -p "$HDFS_DATA_DIR"
        sudo chown -R vagrant:vagrant "$HDFS_DATA_DIR"
        echo "HDFS DataNode directory successfully created."
    else
        echo "HDFS DataNode directory already exists at $HDFS_DATA_DIR. Skipping creation."
    fi
else
    echo "Unknown node type ($HOSTNAME). No HDFS directory configuration applied."
fi


