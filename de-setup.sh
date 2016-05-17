#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "Bro, do you even sudo?" 1>&2
   exit 1
fi
# Install PPAs
sudo add-apt-repository ppa:masterminds/glide

# Build apt-cache
sudo apt-get update

# Install base packages:
sudo apt-get install -y \
  curl\
  vim-nox\
  git\
  make\
  build-essential\
  python-pip\
  python-dev\
  golang\
  glide\
  terminator\
  tree\
  htop\
  atop\
  openvpn\
  dropbox\
  transmission\
  fonts-droid\
  fonts-noto

# Setup Dropbox while we wait
dropbox start -i

#Install extras - Jerks with out good repos
mkdir -p /tmp/de-setup
wget https://atom-installer.github.com/v1.6.1/atom-amd64.deb -O /tmp/de-setup/atom.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/de-setup/chrome.deb
wget https://steamcdn-a.akamaihd.net/client/installer/steam.deb -O /tmp/de-setup/steam.deb
sudo dpkg -i /tmp/de-setup/atom.deb
sudo dpkg -i /tmp/de-setup/chrome.deb
sudo dpkg -i /tmp/de-setup/steam.deb

# Start Steam while we wait
steam&

#Setup u2f
sudo wget https://raw.githubusercontent.com/robertely/libu2f-host/master/70-u2f.rules -O /etc/udev/rules.d/70-u2f.rules

# Set wallpaper
wget https://raw.githubusercontent.com/robertely/de-setup/master/Pam_Cheryl_RPG.png -O ~/Pictures/Pam_Cheryl_RPG.png
gsettings set org.cinnamon.desktop.background picture-uri  "file:///home/rely/Pictures/Pam_Cheryl_RPG.png"
