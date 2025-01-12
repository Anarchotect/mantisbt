HTTPS = https://sourceforge.net/projects/mantisbt/files/mantis-stable/2.27.0/mantisbt-2.27.0.tar.gz/download
ARCH := amd64

all: mantisbt-2.27.0
	docker build $(if $(NEW),--no-cache,) -t anarchotect/mantisbt .

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