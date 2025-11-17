#!/bin/bash

component=$1
environment=$2
dnf install ansible -y

REPO_URL=https://github.com/kukunuri-prasanna17/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf

# Fix log directory & permissions
sudo mkdir -p /var/log/roboshop/
sudo touch /var/log/roboshop/ansible.log

# prepare ansible folder
sudo mkdir -p $REPO_DIR
cd $REPO_DIR


# check if ansible repo is already cloned or not

if [ -d $ANSIBLE_DIR ]; then

    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi
echo "environment is: $2"
ansible-playbook -e component=$component -e env=$environment main.yaml