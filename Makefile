include ./docker/.env

SSL_DIR := $(PWD)/docker/web/nginx/ssl
PUBLIC_DIR_PATH := $(PWD)/src/public

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\t\t\t\t\2/' | column -ts "$$(printf '\t')"

.PHONY: setup # Setup project from scratch.
setup:
	rm -rf $(PWD)/docker/database/backup
	rm -rf $(PWD)/rasa
	$(MAKE) start \
			wait DURATION=25 \
 			database \
 			rasa
	cd $(PWD)/src && $(MAKE) generate && cd $(PWD)
	$(MAKE) status

.PHONY: start # Clean all, generate SSL certificates, install containers, setup git user, setup password and database.
start:
	$(MAKE) kill \
			clean \
			install

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

.PHONY: rasa # Initialize rasa
rasa:
	docker exec -it rasa sh -c 'rasa init'

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

.PHONY: backup # Backup postgres database.
backup:
	docker exec -it postgres sh -c 'pg_dump -U $(DB_USER) $(DB_NAME) > /opt/dump/$(DB_NAME).sql'

.PHONY: restore # Restore the latest database backup.
restore:
	docker exec -it postgres sh -c 'dropdb -f $(DB_NAME) && createdb $(DB_NAME) && psql -U $(DB_USER) $(DB_NAME) < /opt/dump/$(DB_NAME).sql'

.PHONY: logs # Show logs for selected containers. Provide `NAME` variable with container name to show the last 50 logs.
logs:
	docker logs $(NAME) --tail=50

.PHONY: nconf # Reload new nginx configuration.
nconf:
	docker exec -it nginx sh -c 'nginx -s reload'

.PHONY: backup-sql # Backup database SQL file into /opt/backup.
backup-sql:
	- mkdir -p /opt/backup/`date +'%Y%m%d'`
	$(MAKE) backup
	chmod -R 0777 $(PWD)
	cp $(PWD)/docker/database/dump/$(DB_NAME).sql /opt/backup/`date +'%Y%m%d'`/$(DB_NAME).sql

download:
	rm -rf $(PWD)/docker/database/dump/chat_mgsi.sql
	scp -i /home/aleksandar/Downloads/admin.mgsi.chatbot.pem admin@ec2-3-70-172-77.eu-central-1.compute.amazonaws.com:/opt/backup/`date +'%Y%m%d'`/chat_mgsi.sql $(PWD)/docker/database/dump/chat_mgsi.sql