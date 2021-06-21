#!/bin/bash
set -x

# change directory to the where you would like to install Pelias
# Example cd /home/user/Documents/pelias
cd /path/to/install



# clone this repository
git clone https://github.com/pelias/docker.git && cd docker

# install pelias script
# this is the _only_ setup command that should require `sudo`
sudo ln -s "$(pwd)/pelias" /usr/local/bin/pelias

# cd into the project directory
cd projects/egypt



# create a directory to store Pelias data files
# see: https://github.com/pelias/docker#variable-data_dir
# note: use 'gsed' instead of 'sed' on a Mac
mkdir ./data
sed -i '/DATA_DIR/d' .env
echo 'DATA_DIR=./data' >> .env

# run build
pelias compose pull
pelias elastic start
pelias elastic wait
pelias elastic create
pelias download all
pelias prepare all
pelias import all
pelias compose up

# optionally run tests
pelias test run
