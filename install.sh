#!/bin/bash

set -e;

sudo apt-get update;
sudo apt-get install -y build-essential;
sudo apt-get install -y nodejs nodejs-legacy npm;
yes | /dtrace/tools/get-deps.pl;

###########################################
# Install Dtrace for Linux (dtrace4linux) #
###########################################
