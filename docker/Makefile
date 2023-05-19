include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: init # Install docker.
init:
	$(MAKE) docker docker-compose apache2-utils git

.PHONY: docker # Install docker.
docker:
	apt-get remove docker docker-engine docker.io containerd runc
	apt-get update
	apt-get install ca-certificates curl gnupg
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	chmod a+r /etc/apt/keyrings/docker.gpg
	echo \
      "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
      "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	docker --version

.PHONY: docker-compose # Install docker-compose.
docker-compose:
	curl -L https://github.com/docker/compose/releases/download/1.25.3/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	docker-compose --version

.PHONY: apache2-utils # Install apache2-utils.
apache2-utils:
	apt-get install apache2-utils

.PHONY: git # Install Git.
git:
	apt install git
	git --version