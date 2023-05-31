#!/bin/bash

# install docker.
apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |
  tee /etc/apt/sources.list.d/docker.list >/dev/null
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
docker --version

# install docker-compose.
curl -L https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

# install apache2-utils.
apt-get install apache2-utils

# install makefile.
apt-get install make
make --version

# create /var/www/html directory.
mkdir -p /var/www/html

# set aliases
echo -e "

# aleksandar.rakic@yahoo.com working directory.
cd /var/www/html

# aleksandar.rakic@yahoo.com aliases
alias c='clear'
alias ll='ls -all'
alias ..='cd ./../'
alias ch='chmod -R 0777 .'
alias untar='tar -zxvf'

" >>~/.bashrc
