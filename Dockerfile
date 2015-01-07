FROM debian:wheezy
MAINTAINER Michael Schmidt "michael@familie-schmidt.com"

RUN apt-get update && apt-get upgrade
RUN apt-get install -y nginx php5-fpm supervisor

RUN rm /etc/nginx/sites-enabled/*
COPY nginx.conf.d/00-php5-fpm.conf /etc/nginx/conf.d/00-php5-fpm.conf
COPY nginx.sites-enabled/10-virtualhost.conf /etc/nginx/sites-enabled/10-virtualhost.conf
COPY supervisor.conf.d /etc/supervisor/conf.d

EXPOSE 80 443

CMD ["supervisord", "-n"]

