
#!/bin/bash
# Copyright 2018 Tero Karvinen http://TeroKarvinen.com GPL 3
# Modified by Roope Pohjanheimo

echo "Live USB configuration Starting... lapamato4/salt"
set -o verbose

echo "Installing Salt and Git..."
sudo apt-get update
sudo apt-get -y install git salt-minion

echo "Retrieving and Applying Settings..."
echo 'master: localhost'|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service

git clone https://github.com/lapamato4/salt/
cd /srv/salt/
./highstate.sh

echo "Configuring Live Desktop"
setxkbmap fi
sudo timedatectl set-timezone Europe/Helsinki
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple
# git config --global user.email "example@mail.com"
# git config --global user.name "Example"

echo "More tips on http://terokarvinen.com/tag/saltstack"
echo "Done."
