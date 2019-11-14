#!/bin/bash
if [[ $EUID -eq 0 ]]; then
   echo "Do not run with sudo." 1>&2
   exit 1
fi

# Build apt-cache
sudo apt-get update

# Install base packages:
sudo apt-get install -y \
  curl\
  vim-nox\
  git\
  make\
  build-essential\
  tree\
  htop\
  ncdu\
  transmission\
  gparted\
  vlc\
  redshift
