HTTPS = https://sourceforge.net/projects/mantisbt/files/mantis-stable/2.27.0/mantisbt-2.27.0.tar.gz/download
ARCH := amd64

all: mantisbt-2.27.0 mantis_ed25519
	docker build $(if $(NEW),--no-cache,) -t anarchotect/mantisbt .

mantis_ed25519:
	ssh-keygen -C $@ -t ed25519 -a 100 -N 'YourSecureKeyPassword' -f $@

push:
	docker push anarchotect/mantisbt --platform linux/$(ARCH)

mantisbt-2.27.0:
	wget $(HTTPS) -O - | tar -xz -C ./

up:
	docker-compose -f mantis.yml up --force-recreate -d

down:
	docker-compose -f mantis.yml down --remove-orphans

enter:
	sudo docker exec -it mantisbt /bin/bash

reset:
	$(MAKE) down
	$(MAKE) all
	sudo rm -rf /srv/mantisbt
	$(MAKE) up