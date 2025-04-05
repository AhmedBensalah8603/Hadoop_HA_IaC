#!/bin/bash

# Configuring masters file
echo "Configuring masters file..."
cat > $HADOOP_CONF_DIR/masters <<EOL
NameNode
EOL
echo "masters file configured!"

# Configuring workers file
echo "Configuring workers file..."
cat > $HADOOP_CONF_DIR/workers <<EOL
DataNode1
DataNode2
EOL
echo "workers file configured!"

# Chemin vers le fichier hadoop-env.sh
HADOOP_CONF_DIR="/usr/local/hadoop/etc/hadoop"

# Définir JAVA_HOME
JAVA_HOME_PATH="/usr/lib/jvm/java-8-openjdk-amd64"

echo "Configuring hadoop-env.sh..."

# Vérifier et ajouter JAVA_HOME si non présent
grep -qxF "JAVA_HOME=$JAVA_HOME_PATH" $HADOOP_CONF_DIR/hadoop-env.sh || echo "JAVA_HOME=$JAVA_HOME_PATH" >> $HADOOP_CONF_DIR/hadoop-env.sh

# Vérifier et ajouter HADOOP_CLASSPATH si non présent
grep -qxF "export HADOOP_CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-app-3.3.6.jar:\$HADOOP_CLASSPATH" $HADOOP_CONF_DIR/hadoop-env.sh || echo "export HADOOP_CLASSPATH=$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-app-3.3.6.jar:\$HADOOP_CLASSPATH" >> $HADOOP_CONF_DIR/hadoop-env.sh

echo "hadoop-env.sh configured!"

