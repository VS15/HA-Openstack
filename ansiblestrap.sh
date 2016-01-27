#!/bin/bash
#Installs andible 
echo "Updating the system"
sudo apt-get update 
sudo apt-get install ansible -y 
echo 'localhost ansible_connection=local' > /etc/ansible/hosts
echo 'log_path=/vagrant/deployment.log' >> /etc/ansible/ansible.cfg 
