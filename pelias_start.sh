#!/bin/bash
set -x

# change directory to the where you would like to install Pelias - The directory where you want to clone the pelias repo on your local computer
# Example cd /home/user/Documents/pelias
cd /path/to/install



# clone this repository
git clone https://github.com/thepsalmist/pelias.git && cd pelias

# install pelias script
# this is the _only_ setup command that should require `sudo`
sudo ln -s "$(pwd)/pelias" /usr/local/bin/pelias

# cd into the project directory
cd projects/planet



# create a directory to store Pelias data files
# see: https://github.com/pelias/docker#variable-data_dir
# note: use 'gsed' instead of 'sed' on a Mac
mkdir ./data
sed -i '/DATA_DIR/d' .env
echo 'DATA_DIR=./data' >> .env

# run build
git submodule init
git submodule update

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
