#!/usr/bin/env bash
# script for run tests in clean system popstas/squeeze

set -e

service bind9 start > /dev/null
service mysql start > /dev/null

# install server-scripts
if [ ! -d /usr/local/src/server-scripts ]; then
	git clone https://github.com/popstas/server-scripts.git /usr/local/src/server-scripts
fi
cd /usr/local/src/server-scripts
./install.sh -y > /dev/null

# install site-setup
# -v $PWD:/user/local/src/site-setup
#git clone https://github.com/popstas/site-setup.git /usr/local/src/site-setup
cd /usr/local/src/site-setup
./install.sh -y

./run-tests.sh
