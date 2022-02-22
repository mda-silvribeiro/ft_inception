FROM debian:buster

EXPOSE 443

RUN apt-get update 
RUN apt-get install -y vim nginx openssl

COPY ./conf/nginx.config /etc/nginx/sites-available

COPY tools/init.sh /usr/local/bin/
ENTRYPOINT [ "init.sh" ]
CMD ["nginx", "-g", "daemon off;"]
