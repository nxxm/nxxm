#!/bin/bash

if [ "$(uname)" == "Linux" ]; then
  NXXM_URL="https://github.com/nxxm/nxxm/releases/download/v0.0.8/nxxm-v0.0.8-linux-x86_64.zip"
fi

if [ "$(uname)" == "Darwin" ]; then
  NXXM_URL="https://github.com/nxxm/nxxm/releases/download/v0.0.8/nxxm-v0.0.8-macOS.zip"
fi

INSTALL_FOLDER="/usr/local"

abort() {
  printf " \e[91m $1 \n"
  exit 1
}

info() {
  printf "\e[1;32m ---> \e[0m $1 \n"
}

should_install_unzip() {
  if [[ $(command -v unzip) ]]; then
    return 1
  fi
}

if should_install_unzip; then
    info "unzip is needed to unzip the downloaded file, we are installing unzip with your package manager"
    echo "Could you validate with your password ? 😇 "
    sudo apt-get install unzip -y || abort "Error while installing unzip"
fi

info "Downloading nxxm..."
curl -fSL $NXXM_URL --output ~/nxxm.zip || wget -q $NXXM_URL -O ~/nxxm.zip || abort "Could not download nxxm"
info "Installing nxxm in $INSTALL_FOLDER/bin"
sudo unzip ~/nxxm.zip -d $INSTALL_FOLDER -x LICENSE && rm ~/nxxm.zip

if [ $? -eq 0 ]; then
    info "nxxm successfully installed. Installing the dependencies..."
    mkdir /tmp/install_nxxm && echo "#include <iostream> int main(){return 0;}">> /tmp/install_nxxm/installdeps.cpp
    $INSTALL_FOLDER/bin/nxxm /tmp/install_nxxm
    if [ $? -eq 0 ]; then
        info "nxxm and its dependencies have been successfully installed"
    else 
        abort "Error while installing the dependencies"
    fi
else
    abort "Installation failed"
fi
