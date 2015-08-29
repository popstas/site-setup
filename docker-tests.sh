#!/usr/bin/env bash
# script for run tests in clean system popstas/squeeze

service mysql start

# install server-scripts
git clone https://github.com/popstas/server-scripts.git /usr/local/src/server-scripts
cd /usr/local/src/server-scripts
./install.sh -y

# install site-setup
# -v $PWD:/user/local/src/site-setup
#git clone https://github.com/popstas/site-setup.git /usr/local/src/site-setup
cd /usr/local/src/site-setup
./install.sh -y


run-tests.sh

# engine none
#site-setup-engine --verbose --debug --user example --domain example.com --engine "" --rewrite
