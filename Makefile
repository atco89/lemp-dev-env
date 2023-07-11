include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: start # Clean all, generate SSL certificates, setup containers.
start:
	chmod -R 0777 $(PWD)

	$(MAKE) kill \
			clean

	- rm -rf $(PWD)/docker/database/backup \
 			 $(PWD)/docker/web/logs \
 			 $(PWD)/docker/web/nginx/ssl/certs \
 			 $(PWD)/rasa

	$(MAKE) certs \
			htpwd \
			build \
			pause PERIOD=60 \
			migrate \
			rasa-init \
			train \
			status

	chmod -R 0777 $(PWD)

.PHONY: kill # Kill all available containers.
kill:
	- docker kill $$(docker ps -q)

.PHONY: clean # Remove all unused containers, networks, images (both dangling and unreferenced), and volumes.
clean:
	- docker volume rm $$(docker volume ls -q)
	docker system prune -a -f --volumes

.PHONY: certs # Generate a self-signed SSL certificate using OpenSSL.
certs:
	if [ -d $(SSL_DIR)/certs ]; \
		then rm -rf $(SSL_DIR)/certs; \
	fi

	mkdir -m 0777 $(SSL_DIR)/certs

	openssl req \
			-utf8 \
			-x509 \
			-nodes \
			-days 365 \
			-newkey rsa:4096 \
			-keyout $(SSL_DIR)/certs/server.key \
			-out $(SSL_DIR)/certs/server.crt \
			-config $(SSL_DIR)/openssl.cnf

	chmod -R 0777 $(PWD)

.PHONY: build # Builds, (re)creates, starts, and attaches to containers for a service.
build:
	chmod -R 0777 $(PWD)
	docker-compose --file $(PWD)/docker/docker-compose.yaml \
				   --env-file $(PWD)/docker/.env up \
				   --detach \
				   --quiet-pull \
				   --force-recreate \
				   --build
	chmod -R 0777 $(PWD)

.PHONY: htpwd # Create the flat-file used to store username and password for basic authentication of HTTP users.
htpwd:
	htpasswd -cbB $(PWD)/docker/web/nginx/config/fragments/auth/.htpasswd $(HTPASS_USER) $(HTPASS_PASS)

.PHONY: migrate # Execute migrations - the latest available version. Load data fixtures.
migrate:
	docker exec -it php sh -c 'php artisan migrate:install \
							   && php artisan migrate:fresh \
							   && php artisan db:seed'

.PHONY: pause # Pause execution of shell scripts or commands for a given period.
pause:
	sleep $(PERIOD)

.PHONY: rasa # Creates a new project with example training data, actions, and config files.
rasa-init:
	docker exec -it rasa sh -c 'rasa init'

.PHONY: train # Trains a model using your NLU data and stories, saves trained model in ./models.
train:
	- rm -rf $(PWD)/rasa/.rasa/cache \
			 $(PWD)/src/storage/rasa/data/*.yml \
  			 $(PWD)/rasa/models/*.tar.gz \
			 $(PWD)/src/storage/rasa/*.yml \
			 $(PWD)/rasa/out.log

	$(MAKE) generate

	export NUMEXPR_MAX_THREADS=24

	docker exec -it rasa sh -c 'rasa train'
	$(MAKE) restart CONTAINERS='rasa rasa-sdk'
	docker exec -it rasa sh -c 'rasa run actions'

	$(MAKE) pause PERIOD=120

.PHONY: generate # Generate NLU data and stories.
generate:
	chmod -R 0777 $(PWD)

	curl -X GET --insecure https://localhost/generate/nlu

	cp -rf $(PWD)/src/storage/rasa/data/nlu.yml			$(PWD)/rasa/data/nlu.yml
	cp -rf $(PWD)/src/storage/rasa/data/rules.yml		$(PWD)/rasa/data/rules.yml
	cp -rf $(PWD)/src/storage/rasa/data/stories.yml		$(PWD)/rasa/data/stories.yml

	cp -rf $(PWD)/src/storage/rasa/config.yml			$(PWD)/rasa/config.yml
	cp -rf $(PWD)/src/storage/rasa/credentials.yml		$(PWD)/rasa/credentials.yml
	cp -rf $(PWD)/src/storage/rasa/domain.yml			$(PWD)/rasa/domain.yml
	cp -rf $(PWD)/src/storage/rasa/endpoints.yml		$(PWD)/rasa/endpoints.yml

	cp -rf $(PWD)/src/storage/rasa/actions/actions.py	$(PWD)/rasa/actions/actions.py

	chmod -R 0777 $(PWD)

.PHONY: restart-rasa # Restart containers.
restart:
	docker-compose --file $(PWD)/docker/docker-compose.yaml restart $(CONTAINERS)

.PHONY: status # List all images, volumes and containers status.
status:
	@echo "--------------------------------------------------"
	docker ps -a
	@echo "--------------------------------------------------"
	docker images
	@echo "--------------------------------------------------"
	docker volume ls
	@echo "--------------------------------------------------"

.PHONY: push # Update GIT remote refs along with associated objects.
push:
	@if [ $(APP_ENV) = "DEV" ]; then \
		$(PWD)/bash/push.sh; \
	else \
		echo "This command is intended for a DEV environment."; \
	fi

.PHONY: php # Open php container shell terminal.
php:
	docker exec -it php sh

.PHONY: restore # Restore the latest PostgreSQL database backup.
restore:
	docker exec -it postgres sh -c 'dropdb -f $(DB_NAME) && createdb $(DB_NAME) && psql -U $(DB_USER) $(DB_NAME) < /opt/dump/$(DB_NAME).sql'

.PHONY: logs # Show logs for selected containers. Provide `NAME` variable with container name to show the last 50 logs.
logs:
	docker logs $(NAME) --tail=50

.PHONY: nginx # Reload nginx configuration.
nginx:
	docker exec -it nginx sh -c 'nginx -s reload'

.PHONY: store-backup # Store backup database SQL file into /opt/backup.
store-backup:
	@if [ $(APP_ENV) = "PROD" ]; then \
		- mkdir -p /opt/backup/`date +'%Y%m%d'`; \
        $(MAKE) backup; \
        chmod -R 0777 $(PWD); \
        cp $(PWD)/docker/database/dump/$(DB_NAME).sql /opt/backup/`date +'%Y%m%d'`/$(DB_NAME).sql;  \
	else \
		echo "This command is intended for a `PROD` environment."; \
	fi

.PHONY: backup # Backup PostgreSQL database.
backup:
	docker exec -it postgres sh -c 'pg_dump -U $(DB_USER) $(DB_NAME) > /opt/dump/$(DB_NAME).sql'

.PHONY: download # Download the latest PostgreSQL database backup.
download:
	@if [ $(APP_ENV) = "DEV" ]; then \
  		- rm -rf $(PWD)/docker/database/dump/chat_mgsi.sql; \
		scp -i $(AWS_SSH_KEY) $(AWS_USER)@$(AWS_HOST):"/opt/backup/`date +'%Y%m%d'`/chat_mgsi.sql" \
			   $(PWD)/docker/database/dump/chat_mgsi.sql; \
    else \
		echo "This command is intended for a `DEV` environment."; \
	fi
