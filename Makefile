include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: start # Clean all, generate SSL certificates, install containers, setup git user and show status.
start:
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
	$(MAKE) git
	git add $(PWD)
	git commit -m "[`date +'%Y-%m-%d'`] - work in progress."
	git push

.PHONY: git # Configure git user name and email.
git:
	git config user.name $(GIT_NAME)
	git config user.email $(GIT_EMAIL)

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

symfony:
	chmod -R 0777 $(PWD)
	docker exec -it php sh -c 'git config --global user.email $(GIT_EMAIL) \
							   && git config --global user.name $(GIT_NAME) \
							   && symfony new /var/www/html --version="6.2.*" --webapp --php=8.2'
	chmod -R 0777 $(PWD)