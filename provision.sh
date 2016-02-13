#!/bin/bash

INSTALL_PATH="$(pwd)"

apt-get update
apt-get -y upgrade
apt-get -y install puppet screen vim curl

puppet module install garethr-docker
puppet module install KyleAnderson-consul

curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x usr/local/bin/docker-compose
