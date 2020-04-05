#!/bin/bash

## Bash script for setting up a development environment on Ubuntu LTS (18.04).
##
## Installs:
## - Common dependencies and tools for all targets (including: )

# Common dependencies
echo "Installing common dependencies"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y \
    apt-transport-https \
    apt-utils \
    build-essential \
    curl \
    software-properties-common \
    unzip \
    cmake \
    git \
    procps \
    lsb-release \
    wget \
    zip \
    ca-certificates \
    gnupg-agent

# Required python packages
sudo apt-get install -y \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel

#sudo -H pip install --upgrade pip
python3 -m pip install --upgrade pip
python3 -m pip install virtualenv cython
#pip3 install -r requirements.txt
# Clean up
sudo apt-get autoremove -y
sudo apt-get clean -y
#sudo rm -rf /var/lib/apt/lists/*