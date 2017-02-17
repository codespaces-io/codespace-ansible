#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
sudo su

echo "Installing Docker"
#Installing Docker
sudo apt-get update -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update -y
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install docker-engine -y
sudo usermod -aG docker ubuntu
sudo service docker start

echo "Installing emacs git tree bzip2 ntp telnet inetutils-traceroute nmap"
#Installing emacs git tree bzip2 ntp telnet inetutils-traceroute nmap
sudo apt-get install -y emacs git tree bzip2 ntp telnet inetutils-traceroute nmap

echo "Installing Docker-compose"
#Installing Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose

sudo chmod +x /usr/bin/docker-compose

echo "copying codespace code"
#copying codespace code
sudo mkdir -p /codespace
sudo cp /tmp/*.yml /codespace/

echo "starting containers"
cd /codespace && sudo docker-compose up -d && touch /tmp/test-`date "+%H:%M:%S"`
