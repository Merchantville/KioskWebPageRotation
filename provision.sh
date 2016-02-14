#!/bin/bash

function install_docker {
  apt-get -y install apt-transport-https ca-certificates
  apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
  apt-get-y update
  apt-cache policy docker-engine
  apt-get -y install docker-engine
  service docker start
  
  curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x usr/local/bin/docker-compose
  
  usermod -a -G docker webops
}

apt-get update
apt-get -y install screen vim curl

install_docker
