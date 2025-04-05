#!/bin/bash

echo "Configuring hdfs-site.xml..."

HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"
HDFS_SITE_FILE="$HADOOP_CONF_DIR/hdfs-site.xml"

# Ajouter dfs.namenode.name.dir si non présent
if ! grep -q "<name>dfs.namenode.name.dir</name>" "$HDFS_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>dfs.namenode.name.dir</name>\n\
        <value>file:/usr/local/hadoop/hdfs/namenode</value>\n\
    </property>" "$HDFS_SITE_FILE"
    echo "dfs.namenode.name.dir added."
fi

# Ajouter dfs.datanode.data.dir si non présent
if ! grep -q "<name>dfs.datanode.data.dir</name>" "$HDFS_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>dfs.datanode.data.dir</name>\n\
        <value>file:/usr/local/hadoop/hdfs/datanode</value>\n\
    </property>" "$HDFS_SITE_FILE"
    echo "dfs.datanode.data.dir added."
fi

# Ajouter dfs.replication si non présent
if ! grep -q "<name>dfs.replication</name>" "$HDFS_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>dfs.replication</name>\n\
        <value>2</value>\n\
    </property>" "$HDFS_SITE_FILE"
    echo "dfs.replication added."
fi

echo "hdfs-site.xml configured!"

