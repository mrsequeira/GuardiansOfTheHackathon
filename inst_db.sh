#!/bin/bash
sudo rm /etc/postgresql/10/main/pg_hba.conf
# If you need to do this with root privileges use sudo sh -c
sudo sh -c 'echo " # Database administrative login by Unix domain socket
    local   all             postgres                                peer

    # TYPE  DATABASE        USER            ADDRESS                 METHOD

    # local is for Unix domain socket connections only
    local   all             all                                     trust
    # IPv4 local connections:
    host    all             all             127.0.0.1/32            md5
    # IPv6 local connections:
    host    all             all             ::1/128                 md5
    # Allow replication connections from localhost, by a user with the
    # replication privilege.
    local   replication     all                                     peer
    host    replication     all             127.0.0.1/32            md5
    host    replication     all             ::1/128                 md5" >> /etc/postgresql/10/main/pg_hba.conf'

echo '############  Restarting postgres services... ############ '
sudo service postgresql restart

echo '############  Creating db... ############ '
cd /vagrant
sudo rake db:setup
#sudo rake db:setup && rake db:create && rake db:migrate