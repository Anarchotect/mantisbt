FROM debian:bookworm-slim

RUN apt update && apt install -y nginx postgresql-15 php8.2 php8.2-fpm php8.2-mbstring php8.2-pgsql
RUN pg_dropcluster 15 main

COPY mantisbt-2.27.0 /var/www/mantisbt-2.27.0
RUN chmod 755 /var/www/mantisbt-2.27.0/
COPY default /etc/nginx/sites-enabled/default

COPY entrypoint /srv/
WORKDIR /srv/
ENTRYPOINT ["/srv/entrypoint"]