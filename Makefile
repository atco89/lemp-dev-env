include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: init # Clean all, generate SSL certificates, install containers, setup git user, add phpinfo file and show status.
init:
	$(MAKE) start phpinfo

.PHONY: phpinfo # Create public directory inside source directory with index.php file which as an output gives information's about php version installed.
phpinfo:
	if [ -d $(PUBLIC_DIR_PATH) ]; \
		then rm -rf $(PUBLIC_DIR_PATH); \
	fi

	chmod -R 0777 $(PWD)
	mkdir -p -m 0777 $(PUBLIC_DIR_PATH)
	echo "<?php\n\nphpinfo();" >> "$(PUBLIC_DIR_PATH)/index.php"
	chmod -R 0777 $(PWD)

.PHONY: prod # Clean all, generate SSL certificates, install containers, setup git user, setup password and database.
prod:
	$(MAKE) start && cd $(PWD)/src && $(MAKE) nlu && cd $(PWD)

.PHONY: start # Clean all, generate SSL certificates, install containers, setup git user, setup password and database.
start:
	$(MAKE) kill \
			clean \
			certs \
			install \
			htpasswd \
			wait DURATION=30 \
			database \
			rasa-init \
			status

.PHONY: kill # Kill all available containers.
kill:
	- docker kill $$(docker ps -q)

.PHONY: clean # Removes all object files, backup files, and other unnecessary files still remaining after compilation has finished.
clean:
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
	htpasswd -cbB "$(PWD)/docker/web/nginx/config/fragments/auth/.htpasswd" $(HTPASS_USER) $(HTPASS_PASS)

.PHONY: database # Install database.
database:
	docker exec -it php sh -c 'php artisan migrate:install \
								&& php artisan migrate:fresh \
								&& php artisan db:seed'

.PHONY: wait # Timeout execution duration is passed with param DURATION=100.
wait:
	sleep $(DURATION)

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

.PHONY: rasa-init # Rasa init.
rasa-init:
	docker exec -it rasa sh -c 'rasa init'

.PHONY: php # Open php container terminal.
php:
	docker exec -it php sh

.PHONY: backup # Backup postgres database.
backup:
	docker exec -it postgres sh -c 'pg_dump -Fc $(DB_NAME) -U $(DB_USER) | gzip > /opt/backups/$(DB_NAME).dump.gz'

.PHONY: restore # Restore the latest database backup.
restore:
	docker exec -it postgres sh -c 'pg_restore -U $(DB_USER) -d $(DB_NAME) < /opt/backups/$(DB_NAME).dump'

.PHONY: logs # Show logs for selected containers. Provide `NAME` variable with container name to show the last 50 logs.
logs:
	docker logs $(NAME) --tail=50