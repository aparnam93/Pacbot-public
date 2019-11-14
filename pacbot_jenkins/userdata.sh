#!/bin/bash
sudo hostnamectl set-hostname --static auslajnkns01d.regeneron.regn.com
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart  sshd
sudo realm permit s.aparna.manjunath
sudo echo "s.aparna.manjunath  ALL=(ALL)   ALL" >> /etc/sudoers
sudo yum remove java-1.7.0-openjdk
sudo yum install java-1.8.0 -y
sudo yum update –y
sudo yum install unzip wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
sudo chkconfig jenkins on
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service
sudo wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
sudo unzip terraform_0.11.8_linux_amd64.zip
sudo mv terraform /usr/bin/
