FROM debian:bookworm-slim

RUN apt update && apt install -y nginx php8.2 php8.2-fpm php8.2-mbstring php8.2-pgsql openssh-server

COPY mantisbt-2.27.0 /var/www/mantisbt-2.27.0
RUN chmod 755 /var/www/mantisbt-2.27.0/
RUN chown -R www-data:www-data /var/www/
COPY default /etc/nginx/sites-enabled/default

RUN useradd --create-home tunnel
RUN sed -i 's/tunnel:!/tunnel:*/' /etc/shadow

COPY entrypoint /srv/
WORKDIR /srv/
ENTRYPOINT ["/srv/entrypoint"]
