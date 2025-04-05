#!/bin/bash

HOSTNAME=$(hostname)

if [[ "$HOSTNAME" == "NameNode" ]]; then
    sudo chown -R vagrant:vagrant /usr/local/hadoop/
    sudo chmod -R 755 /usr/local/hadoop/
    echo "Formatting NameNode..."
    hdfs namenode -format 
    echo "NameNode formatted successfully."
fi
