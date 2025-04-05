#!/bin/bash

echo "Configuring mapred-site.xml..."

HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"
MAPRED_SITE_FILE="$HADOOP_CONF_DIR/mapred-site.xml"

# Ajouter mapreduce.framework.name si non présent
if ! grep -q "<name>mapreduce.framework.name</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapreduce.framework.name</name>\n\
        <value>yarn</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapreduce.framework.name added."
fi

# Ajouter mapreduce.jobhistory.address si non présent
if ! grep -q "<name>mapreduce.jobhistory.address</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapreduce.jobhistory.address</name>\n\
        <value>master:10020</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapreduce.jobhistory.address added."
fi

# Ajouter mapreduce.jobhistory.webapp.address si non présent
if ! grep -q "<name>mapreduce.jobhistory.webapp.address</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapreduce.jobhistory.webapp.address</name>\n\
        <value>master:19888</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapreduce.jobhistory.webapp.address added."
fi

# Ajouter yarn.app.mapreduce.am.staging-dir si non présent
if ! grep -q "<name>yarn.app.mapreduce.am.staging-dir</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.app.mapreduce.am.staging-dir</name>\n\
        <value>/user</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "yarn.app.mapreduce.am.staging-dir added."
fi

# Ajouter mapreduce.jobtracker.address si non présent
if ! grep -q "<name>mapreduce.jobtracker.address</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapreduce.jobtracker.address</name>\n\
        <value>master:9001</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapreduce.jobtracker.address added."
fi

# Ajouter mapred.local.dir si non présent
if ! grep -q "<name>mapred.local.dir</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapred.local.dir</name>\n\
        <value>\${hadoop.tmp.dir}/mapred/local</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapred.local.dir added."
fi

# Ajouter mapred.map.tasks si non présent
if ! grep -q "<name>mapred.map.tasks</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapred.map.tasks</name>\n\
        <value>20</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapred.map.tasks added."
fi

# Ajouter mapred.reduce.tasks si non présent
if ! grep -q "<name>mapred.reduce.tasks</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapred.reduce.tasks</name>\n\
        <value>2</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapred.reduce.tasks added."
fi

# Ajouter yarn.app.mapreduce.am.env si non présent
if ! grep -q "<name>yarn.app.mapreduce.am.env</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>yarn.app.mapreduce.am.env</name>\n\
        <value>HADOOP_MAPRED_HOME=\$HADOOP_HOME</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "yarn.app.mapreduce.am.env added."
fi

# Ajouter mapreduce.map.env si non présent
if ! grep -q "<name>mapreduce.map.env</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapreduce.map.env</name>\n\
        <value>HADOOP_MAPRED_HOME=\$HADOOP_HOME</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapreduce.map.env added."
fi

# Ajouter mapreduce.reduce.env si non présent
if ! grep -q "<name>mapreduce.reduce.env</name>" "$MAPRED_SITE_FILE"; then
    sed -i "/<\/configuration>/i \
    <property>\n\
        <name>mapreduce.reduce.env</name>\n\
        <value>HADOOP_MAPRED_HOME=\$HADOOP_HOME</value>\n\
    </property>" "$MAPRED_SITE_FILE"
    echo "mapreduce.reduce.env added."
fi

echo "mapred-site.xml configured!"

