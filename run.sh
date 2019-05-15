#!/bin/sh
#
#
 
# Setup a few tools required for the build
sudo dnf install -y python-setuptools git ansible
 
# Get the directory structure setup
cd ~
mkdir -p git
cd git
git clone https://github.com/tzurita/fedora-setup.git
cd fedora-setup

sudo easy_install pip

# Get necessary roles for the build
ansible-galaxy install -r requirements.yml
ansible-playbook setup.yml -i HOSTS --ask-sudo-pass --ask-vault-pass
