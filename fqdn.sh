#!/bin/bash

echo '############  remd. ############ '
sudo rm /etc/hosts
# If you need to do this with root privileges use sudo sh -c
sudo sh -c 'echo " 
127.0.0.1 localhost localhost.localdomain
127.0.1.1 myhost.mydomain.eu myhost.domain2.eu myhost

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
" >> /etc/hosts '

cat /etc/hosts 

sudo hostname localhost.localdomain
sudo service sendmail restart
hostname -f



