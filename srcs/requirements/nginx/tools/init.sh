#!/bin/bash

    ln -s /etc/nginx/sites-available/nginx.config /etc/nginx/sites-enabled
    chown -R www-data:www-data /var/www/*
    chmod -R 755 /var/www/*


    openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
        -keyout /etc/ssl/nginx-selfsigned.key \
        -out /etc/ssl/nginx-selfsigned.crt \
        -subj "/C=PT/ST=LISBON/L=LISBON/O=42/CN=mda-silv"

    #sed -ie 's/gzip on;/gzip off;/g' /etc/nginx/nginx.conf

exec "$@"