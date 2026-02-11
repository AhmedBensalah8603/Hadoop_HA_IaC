# Hadoop Base Box (Vagrant + Ansible)

## 📌 Overview

This directory builds a reusable **Hadoop base Vagrant box** containing:

- Ubuntu 22.04 (jammy64)
- OpenJDK 8
- Hadoop 3.3.6
- ZooKeeper 3.8.4

This box acts as a pre-configured base image for the HA Hadoop cluster.

Think of it like a cloud-init golden image (similar to Terraform image baking).

---

## 🏗 Architecture

**Provisioning** is done using:

- Vagrant
- Ansible (local provisioner)

**Roles**:

- java
- hadoop
- zookeeper

All **software is installed** under:

    /usr/local/hadoop

    /usr/local/zookeeper

**Environment variables** are configured globally via:

    /etc/profile.d/*.sh

---

## 🚀 How to Build the Box

### 1️⃣ Start the VM

    vagrant up
    vagrant ssh

### 2️⃣ Validate Installation

    java -version
    hadoop version
    echo $ZOOKEEPER_HOME
    zkCli.sh -version
    ls -l $ZOOKEEPER_HOME/conf
    exit

### 3️⃣ Package the Box

    vagrant halt
    vagrant package --output Bensalah-hadoop.box
    vagrant box add Bensalah-hadoop Bensalah-hadoop.box
    rm -f Bensalah-hadoop.box
    vagrant destroy -f

You now have a reusable box:

    Bensalah-hadoop

---

## 📁 Structure


    hadoop_box/
    │
    ├── Vagrantfile
    ├── steps.txt
    └── ansible/
        ├── playbook.yml
        └── roles/
            ├── java/
            ├── hadoop/
            └── zookeeper/

---

## 🎯 Purpose

- Reduces provisioning time for the HA cluster
- Ensures consistent Hadoop & ZooKeeper versions
- Mimics image baking (like Terraform + Packer)

---

## 📦 Software Versions

- Ubuntu 22.04
- OpenJDK 8
- Hadoop 3.3.6
- ZooKeeper 3.8.4

---

## ⚠ Notes

- Uses Java 8 for Hadoop compatibility
- Designed for VirtualBox provider
- Lab / demo environment

## ⭐ Leave a Star

If this base Hadoop box helped you:

- ⭐ Star the repository
- 🍴 Fork it
- 📢 Share it with others learning Hadoop HA

Your support helps keep the project maintained and improved.

