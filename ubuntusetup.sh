#!/bin/bash

#update
sudo apt-get update && sudo apt-get --assume-yes upgrade

#Terminal only on Launcher
sudo gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-terminal.desktop']"
unity --replace &

#Adding Google Chrome PPA
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#Install Google Chrome
sudo apt-get update
sudo apt-get --assume-yes install google-chrome-stable
google-chrome-stable &
