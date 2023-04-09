include ./docker/.env

SSL_DIR = $(CURDIR)/docker/web/ssl

.PHONY: help # Generate list of targets with descriptions.
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1:\t\2/' | column -ts "$$(printf '\t')"

.PHONY: start # Clean all, generate SSL certificates, install containers, setup git user and show status.
start:
	$(MAKE) kill clean certs install git status

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
		-x509 \
		-nodes \
		-days 365 \
		-newkey rsa:4096 \
		-keyout "$(SSL_DIR)/certs/server.key" \
		-out "$(SSL_DIR)/certs/server.crt" \
		-config "$(SSL_DIR)/openssl.cnf"

	chmod -R 0777 $(CURDIR)

.PHONY: install # Build containers.
install:
	chmod -R 0777 $(CURDIR)
	docker-compose -f "$(CURDIR)/docker/docker-compose.yaml" up -d --build
	chmod -R 0777 $(CURDIR)

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

.PHONY: push # Push all changes on current branch.
push:
	git add $(CURDIR)
	git commit -m "[`date +'%Y-%m-%d'`] - work in progress."
	git push

.PHONY: php # Open php container terminal.
php:
	docker exec -it php bash

.PHONY: mysql # Open mysql container terminal.
mysql:
	docker exec -it mysql bash

.PHONY: backup # Backup database.
backup:
	chmod -R 0777 $(CURDIR)
	docker exec mysql "/usr/bin/mysqldump" -u root --password=$(DB_ROOT_PASS) $(DB_NAME) > "$(CURDIR)/docker/database/dump/$(DB_NAME)_dump.sql"
	chmod -R 0777 $(CURDIR)

.PHONY: restore # Restore the latest database backup.
restore:
	cat "$(CURDIR)/docker/database/dump/$(DB_NAME)_dump.sql" | docker exec -i database /usr/bin/mysql -u root --password=$(DB_ROOT_PASS) $(DB_NAME)

.PHONY: logs # Show logs for selected containers. Provide `NAME` variable with container name to show the last 50 logs.
logs:
	docker logs $(NAME) --tail=50