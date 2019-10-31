#!/bin/bash
cd /opt
yum update -y
yum install git -y
yum install wget -y

#Install and setup Python3.6
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install epel-release -y
sudo yum install python3-pip -y
sudo echo alias python3=python3.7 >> ~/.bashrc
sudo echo alias pip3=pip3.7 >> ~/.bashrc
sudo source ~/.bashrc

#Clone Repo

git clone -b "development" https://github.com/aparnam93/Pacbot-public.git

#Other Prereqs
yum -y install java-1.8.0-openjdk docker maven unzip mysql
systemctl start docker
wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
unzip terraform_0.11.8_linux_amd64.zip
mv terraform /usr/bin/
pip3.7 install -r /opt/Pacbot-public/installer/requirements.txt


#Setup UI components
cd /opt/Pacbot-public/webapp
sudo yum install nodejs npm -y
npm install -g @angular/cli@1.6.8
sudo npm install -g bower
sudo npm install -g yarn
sudo npm install
sudo bower install
bower install --allow-root


#Copy the default Settings file and create a local.py
cp /opt/Pacbot-public/installer/settings/default.local.py  /opt/Pacbot-public/installer/settings/local.py


# Launch UI
cd /opt/Pacbot-public/installer/
ng serve &>/dev/null
python3.7 /opt/Pacbot-public/installer/manager.py install