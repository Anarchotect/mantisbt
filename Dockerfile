FROM debian:bookworm-slim

RUN apt update && apt install -y nginx postgresql-15 php8.2 php8.2-fpm php8.2-mbstring php8.2-pgsql openssh-server
RUN pg_dropcluster 15 main

COPY mantisbt-2.27.0 /var/www/mantisbt-2.27.0
RUN chmod 755 /var/www/mantisbt-2.27.0/
RUN chown -R www-data:www-data /var/www/
COPY default /etc/nginx/sites-enabled/default

RUN sed -i 's/postgres:!/postgres:*/' /etc/shadow
RUN mkdir -p /var/lib/postgresql/.ssh/
COPY mantis_ed25519.pub /var/lib/postgresql/.ssh/authorized_keys
COPY sshd_config /etc/ssh/sshd_config

COPY entrypoint /srv/
WORKDIR /srv/
ENTRYPOINT ["/srv/entrypoint"]
