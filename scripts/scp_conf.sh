#!/bin/bash

DATANODES=("DataNode1" "DataNode2")
HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"

echo "Copying Hadoop configuration to DataNodes..."

for NODE in "${DATANODES[@]}"; do
    scp $HADOOP_CONF_DIR/* vagrant@$NODE:$HADOOP_CONF_DIR/
    echo "Configuration copied to $NODE"
done

echo "Configuration files transferred to DataNodes successfully."
