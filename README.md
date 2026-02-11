# Hadoop HA Cluster Automation (Vagrant + Ansible)

## 👋 Welcome!

Setting up a Hadoop High Availability cluster is **notoriously painful**.  
Multiple nodes, ZooKeeper, JournalNodes, NameNode failover… it usually takes hours of manual configuration.  

Good news: I’ve done all the hard work for you!  

With this project, you can have your **own fully functional Hadoop HA cluster running locally in under 15 minutes**.  

Yes, seriously !! no headaches, no endless configuration edits.

---

## 🚀 What This Project Does

- Builds a reusable **Hadoop base box** with:
  - Ubuntu 22.04
  - OpenJDK 8
  - Hadoop 3.3.6
  - ZooKeeper 3.8.4
- Deploys a **4-node HA cluster**:
  - 2 NameNodes (Active/Standby)
  - 2 DataNodes
  - 3 JournalNodes (for HDFS HA)
  - YARN HA (ResourceManager active/standby)
  - ZooKeeper quorum
- Handles **automatic failover** using ZKFC
- Sets up all **environment variables, directories, and config files** for you

---

## ⏱ How Fast Can You Go?

If you follow the steps:

1. Build the base box  
2. Spin up the HA cluster  

…your cluster will be ready in **less than 15 minutes**, even if you’ve never built a Hadoop cluster before.

---

## ✅ Requirements

Make sure your machine has:

- **Vagrant 2.4.9**  
  Install: https://developer.hashicorp.com/vagrant/downloads

- **Ansible Core 2.16.3**  
  Install:

  `sudo apt install ansible` 
  
  OR via pip: 
  
  `pip install ansible-core==2.16.3 --user`

- **VirtualBox**  
  Install: 
  
  `sudo apt install virtualbox`

Check versions:

    vagrant --version  
    ansible --version  

---

## 📥 Quick Start

This project is split into two parts:

1️⃣ **Build the Base Hadoop Box**  
All the base system setup (Java, Hadoop, ZooKeeper) is handled in the `hadoop_box` folder.  
For detailed instructions, go to:

    hadoop_box/README.md

2️⃣ **Deploy the High Availability Cluster**  
Once the base box is ready, you can spin up the full HA cluster (NameNodes, DataNodes, YARN, ZooKeeper quorum) using the `hadoop_HA_cluster` folder.  
For step-by-step deployment, go to:  

    hadoop_HA_cluster/README.md

---

## 💡 Tip:  
Follow the READMEs in order: **first the base box**, then **the HA cluster**, and you’ll have a fully functional Hadoop cluster in under 15 minutes!
