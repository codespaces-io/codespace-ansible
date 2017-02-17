#!/bin/bash -eux

sleep 30

echo "==> Updating list of repositories"
# apt-get update does not actually perform updates, it just downloads and indexes the list of packages
sudo apt-get -y update
