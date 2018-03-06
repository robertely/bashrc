#!/bin/bash
if [[ $EUID -eq 0 ]]; then
   echo "Do not run with sudo." 1>&2
   exit 1
fi

# PPAs
# Kicad
sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y
# Kicad nightly - http://i3.kym-cdn.com/photos/images/newsfeed/000/511/991/3a5.jpg
sudo add-apt-repository --yes ppa:js-reynaud/ppa-kicad

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
  python3-pip\
  golang\
  terminator\
  tree\
  htop\
  atop\
  openvpn\
  transmission\
  fonts-droid-fallback\
  fonts-noto-cjk\
  gparted\
  vlc\
  redshift


#Install extras - Jerks with out good repos
mkdir -p /tmp/de-setup
wget https://atom.io/download/deb -O /tmp/de-setup/atom.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/de-setup/chrome.deb
sudo dpkg -i /tmp/de-setup/atom.deb
sudo dpkg -i /tmp/de-setup/chrome.deb

# Pythoooon
sudo pip install pep8

# Install atom packes
apm install \
  minimap\
  autocomplete-python\
  autocomplete-go\
  autocomplete-bash-builtins\
  linter-python-pep8\
  atom-beautify\
  file-icons
  

#Setup u2f
sudo wget https://raw.githubusercontent.com/robertely/libu2f-host/master/70-u2f.rules -O /etc/udev/rules.d/70-u2f.rules

#Serial
sudo adduser rely dialout

