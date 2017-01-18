#!/bin/bash

cd /packer/ubuntu-16.04.1/packer-ubuntu-k8 && packer build -force -only=virtualbox-iso -var-file=ubuntu1604.json ubuntu.json
