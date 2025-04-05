#!/bin/bash

echo "Configuring yarn-site.xml..."

HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"
YARN_SITE_FILE="$HADOOP_CONF_DIR/yarn-site.xml"

# Ajouter yarn.resourcemanager.hostname si non présent
if ! grep -q "<name>yarn.resourcemanager.hostname</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.resourcemanager.hostname</name>\n\
        <value>NameNode</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.resourcemanager.hostname added."
fi

# Ajouter yarn.nodemanager.local-dirs si non présent
if ! grep -q "<name>yarn.nodemanager.local-dirs</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.nodemanager.local-dirs</name>\n\
        <value>file:/usr/local/hadoop/yarn/local</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.nodemanager.local-dirs added."
fi

# Ajouter yarn.nodemanager.log-dirs si non présent
if ! grep -q "<name>yarn.nodemanager.log-dirs</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.nodemanager.log-dirs</name>\n\
        <value>file:/usr/local/hadoop/yarn/log</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.nodemanager.log-dirs added."
fi

# Ajouter yarn.log.server.url si non présent
if ! grep -q "<name>yarn.log.server.url</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.log.server.url</name>\n\
        <value>http://NameNode:19888/jobhistory/logs</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.log.server.url added."
fi

# Ajouter yarn.nodemanager.aux-services si non présent
if ! grep -q "<name>yarn.nodemanager.aux-services</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.nodemanager.aux-services</name>\n\
        <value>mapreduce_shuffle</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.nodemanager.aux-services added."
fi

# Ajouter yarn.nodemanager.aux-services.mapreduce_shuffle.class si non présent
if ! grep -q "<name>yarn.nodemanager.aux-services.mapreduce_shuffle.class</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.nodemanager.aux-services.mapreduce_shuffle.class</name>\n\
        <value>org.apache.hadoop.mapred.ShuffleHandler</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.nodemanager.aux-services.mapreduce_shuffle.class added."
fi

# Ajouter yarn.nodemanager.disk-health-checker.max-disk-utilization-per-disk-percentage si non présent
if ! grep -q "<name>yarn.nodemanager.disk-health-checker.max-disk-utilization-per-disk-percentage</name>" "$YARN_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.nodemanager.disk-health-checker.max-disk-utilization-per-disk-percentage</name>\n\
        <value>100</value>\n\
    </property>" "$YARN_SITE_FILE"
    echo "yarn.nodemanager.disk-health-checker.max-disk-utilization-per-disk-percentage added."
fi

echo "yarn-site.xml configured!"

