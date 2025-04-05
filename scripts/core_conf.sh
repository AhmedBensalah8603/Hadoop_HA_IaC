#!/bin/bash

echo "Configuring core-site.xml..."

HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"
CORE_SITE_FILE="$HADOOP_CONF_DIR/core-site.xml"

# Vérifier si la propriété existe déjà
if ! grep -q "<name>fs.defaultFS</name>" "$CORE_SITE_FILE"; then
    # Insérer le bloc juste avant </configuration>
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>fs.defaultFS</name>\n\
        <value>hdfs://NameNode:9000</value>\n\
    </property>" "$CORE_SITE_FILE"
    echo "fs.defaultFS property added."
fi

echo "core-site.xml configured!"

