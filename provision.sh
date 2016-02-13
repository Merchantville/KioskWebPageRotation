#!/bin/bash

INSTALL_PATH="$(pwd)"

apt-get update
apt-get -y upgrade
apt-get -y install puppet screen vim

puppet module install garethr-docker
puppet module install KyleAnderson-consul
