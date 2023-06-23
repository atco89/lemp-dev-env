include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: dev # Clean all, generate SSL certificates, setup containers.
start:
	- rm -rf $(PWD)/docker/database/backup \
 			 $(PWD)/docker/jenkins \
 			 $(PWD)/docker/web/log \
 			 $(PWD)/docker/web/nginx/ssl/certs \
 			 $(PWD)/src/migrations/*.php \
 			 $(PWD)/src/public/build \
 			 $(PWD)/src/var

	$(MAKE) kill \
			clean \
			ssl-certificates \
			install \
			dependencies \
			htpasswd \
			database \
 			jobs \
 			status

.PHONY: kill # Kills all containers.
kill:
	- docker kill $$(docker ps -q)

.PHONY: clean # Remove all unused containers, networks, images (both dangling and unreferenced), and volumes.
clean:
	- docker volume rm $$(docker volume ls -q)
	docker system prune -a -f --volumes

.PHONY: ssl-certificates # Generate a self-signed SSL certificate using OpenSSL.
ssl-certificates:
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

.PHONY: install # Builds, (re)creates, starts, and attaches to containers for a service.
install:
	chmod -R 0777 $(PWD)
	docker-compose -f $(PWD)/docker/docker-compose.yaml --env-file $(PWD)/docker/.env up -d --build
	chmod -R 0777 $(PWD)
	sleep 30

.PHONY: dependencies # Install npm and composer packages.
dependencies:
	chmod -R 0777 $(PWD)
	docker exec -it php sh -c 'npm i && npm run dev && composer install'
	chmod -R 0777 $(PWD)

.PHONY: htpasswd # Create the flat-files used to store usernames and password for basic authentication of HTTP users.
htpasswd:
	- apt-get install apache2-utils
	htpasswd -cbB $(PWD)/docker/web/nginx/config/fragments/auth/.htpasswd $(HTPASS_USER) $(HTPASS_PASS)

.PHONY: database # Creates a new migration based on database changes. Execute a migration - the latest available version. Load data fixtures.
database:
	chmod -R 0777 $(PWD)
	docker exec -it php sh -c 'php bin/console --no-interaction make:migration \
							   && php bin/console --no-interaction doctrine:migrations:migrate \
							   && php bin/console --no-interaction doctrine:fixtures:load'
	chmod -R 0777 $(PWD)

.PHONY: jobs # Run all jobs once.
jobs:
	docker exec -it php sh -c './jobs.sh'

.PHONY: status # List containers, show all top level images, their repository and tags, and their size and volumes.
status:
	@echo "=================================================="
	docker ps -a
	@echo "=================================================="
	docker images
	@echo "=================================================="
	docker volume ls
	@echo "=================================================="

.PHONY: push # Push all changes on current branch.
push:
	$(PWD)/bash/push.sh

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

.PHONY: clear-cache # Clear project cache.
clear-cache:
	chmod -R 0777 $(PWD)
	docker exec -it php sh -c 'rm -rf ./var/cache \
							   && rm -rf ./public/build \
							   && php bin/console cache:clear \
							   && composer dump-autoload -o'
	chmod -R 0777 $(PWD)

.PHONY: ssh # SSH on AWS EC2.
ssh:
	ssh -i $(AWS_CERT) $(AWS_USER)@$(AWS_HOST)

.PHONY: r-ngx # Reload NGINX configuration.
r-ngx:
	docker exec -it nginx nginx -s reload
