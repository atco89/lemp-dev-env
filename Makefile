include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: start # Clean all, generate SSL certificates, install containers, setup git user and show status.
start:
	- rm -rf $(PWD)/docker/database/backup
	$(MAKE) kill clean certs install htpasswd

.PHONY: kill # Kill all available containers.
kill:
	- docker kill $$(docker ps -q)

.PHONY: clean # Removes all object files, backup files, and other unnecessary files still remaining after compilation has finished.
clean:
	- docker volume rm $$(docker volume ls -q)
	docker system prune -a -f --volumes

.PHONY: certs # Generate SSL certificates.
certs:
	if [ -d "$(SSL_DIR)/certs" ]; \
		then rm -rf "$(SSL_DIR)/certs"; \
	fi

	mkdir -m 0777 "$(SSL_DIR)/certs"

	openssl req \
		-utf8 \
		-x509 \
		-nodes \
		-days 365 \
		-newkey rsa:4096 \
		-keyout "$(SSL_DIR)/certs/server.key" \
		-out "$(SSL_DIR)/certs/server.crt" \
		-config "$(SSL_DIR)/openssl.cnf"

	chmod -R 0777 $(PWD)

.PHONY: install # Build containers.
install:
	chmod -R 0777 $(PWD)
	docker-compose -f "$(PWD)/docker/docker-compose.yaml" --env-file "$(PWD)/docker/.env" up -d --build
	chmod -R 0777 $(PWD)

.PHONY: htpasswd # Generate htpasswd file with defined user and password.
htpasswd:
	- apt-get install apache2-utils
	htpasswd -cbB "$(PWD)/docker/web/nginx/config/fragments/auth/.htpasswd" $(HTPASS_USER) $(HTPASS_PASS)

.PHONY: push # Push all changes on current branch.
push:
	$(PWD)/bash/git-push.sh

.PHONY: status # List all images, volumes and containers status.
status:
	@echo "=================================================="
	docker ps -a
	@echo "=================================================="
	docker images
	@echo "=================================================="
	docker volume ls
	@echo "=================================================="

.PHONY: php # Open php container terminal.
php:
	docker exec -it php sh

.PHONY: mysql # Open mysql container terminal.
mysql:
	docker exec -it mysql sh

.PHONY: backup # Backup database.
backup:
	- mkdir -m 0777 "$(PWD)/docker/database/dump"
	chmod -R 0777 $(PWD)
	docker exec mysql "/usr/bin/mysqldump" -u root --password="$(DB_ROOT_PASS)" $(DB_NAME) > "$(PWD)/docker/database/dump/$(DB_NAME)_dump.sql"
	chmod -R 0777 $(PWD)

.PHONY: restore # Restore the latest database backup.
restore:
	cat "$(PWD)/docker/database/dump/$(DB_NAME)_dump.sql" | docker exec -i mysql "/usr/bin/mysql" -u root --password=$(DB_ROOT_PASS) $(DB_NAME)

.PHONY: logs # Show logs for selected containers. Provide `NAME` variable with container name to show the last 50 logs.
logs:
	docker logs $(NAME) --tail=50

.PHONY: dev # Setup clean dev environment.
dev:
	$(MAKE) clear-cache \
			kill \
			clean

	- rm -rf $(PWD)/docker/database/backup
	- rm -rf $(PWD)/src/migrations/*.php

	$(MAKE) certs \
			install \
			htpasswd

	sleep 30

	$(MAKE) database \
 			jobs \
 			status

.PHONY: clear-cache # Clear project cache.
clear-cache:
	chmod -R 0777 $(PWD)
	docker exec -it php sh -c 'rm -rf ./var/cache \
							   && php bin/console cache:clear \
							   && composer dump-autoload -o'
	chmod -R 0777 $(PWD)

.PHONY: database # Setup database tables and initial data.
database:
	chmod -R 0777 $(PWD)
	docker exec -it php sh -c 'php bin/console make:migration \
							   && php bin/console doctrine:migrations:migrate \
							   && php bin/console doctrine:fixtures:load'
	chmod -R 0777 $(PWD)

jobs:
	docker exec -it php sh -c './jobs.sh'