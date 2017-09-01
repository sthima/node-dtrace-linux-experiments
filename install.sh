#!/bin/bash

set -e;

sudo apt update
sudo apt install -y build-essential
sudo apt install nodejs nodejs-legacy npm
yes | /dtrace/tools/get-deps.pl;

###########################################
# Install Dtrace for Linux (dtrace4linux) #
###########################################

cd /dtrace/;
make all;
sudo make install;
sudo make load;
