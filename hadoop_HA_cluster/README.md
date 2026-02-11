# Hadoop High Availability Cluster (HDFS + YARN HA)

## 📌 Overview

This project deploys a fully automated Hadoop HA cluster using Vagrant and Ansible.

---

## 🏗 Cluster Nodes

    NameNode   -> Active NN + RM
    StandBy    -> Standby NN + RM
    DataNode1  -> DataNode + JournalNode + ZooKeeper
    DataNode2  -> DataNode

---

## 🚀 Deployment

    cd hadoop_HA_cluster
    vagrant up

---

## 🌐 Web UIs

    NameNode UI     -> http://localhost:9870
    Standby NN UI   -> http://localhost:9871
    YARN RM         -> http://localhost:8088
    History Server  -> http://localhost:19888

---

## 🔄 Safe Restart

    vagrant halt && vagrant up

---

## ⭐ Leave a Star

If this HA cluster setup helped you understand:

- Hadoop HDFS High Availability
- YARN HA with ZooKeeper
- Infrastructure as Code

Please ⭐ star the repository and share it with the community.

It really helps and is much appreciated 🙌
