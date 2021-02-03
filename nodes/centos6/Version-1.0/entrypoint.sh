#!/bin/bash 
cat /dev/zero  | ssh-keygen -q -N ""  -b 1024 -t rsa -f /etc/ssh/ssh_host_key
cat /dev/zero  | ssh-keygen -q -N ""  -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key
cat /dev/zero  | ssh-keygen -q -N ""  -b 1024 -t dsa -f /etc/ssh/ssh_host_dsa_key

exec "$@" 



