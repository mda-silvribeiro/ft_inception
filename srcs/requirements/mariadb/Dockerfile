# https://hub.docker.com/_/mariadb
# image name
# all images must have a FROM
# usually from a minimal Linux distribution like debian or (even better) alpine
# if you truly want to start with an empty container, use FROM scratch
FROM        debian:buster

LABEL		maintener="mda-silv@student.42lisboa.com" release-date="2022-01-13"

# expose these ports on the docker virtual network
# you still need to use -p or -P to open/forward these ports on host
EXPOSE 3306

RUN apt-get update -y
RUN apt-get install mariadb-server -y

COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN chmod 444 /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/reset.sh /var/www/
RUN chmod 755 /var/www/reset.sh

ENTRYPOINT ["bash", "/var/www/reset.sh"]

# required: run this command when container is launched
# only one CMD allowed, so if there are multiple, last one wins

#docker build -t db -f Dockerfile . // -t (tagename) -f(espesifica o arquivo para gerar)
#docker image ls

# init container
# docker run -d --rm --name db-container db // -d (detach vai ser executada no background)
# rm significa que se o cotainer ja existir ele ser removida para que um novo possa ser criado
# docker ps
# https://github.com/compose-spec/compose-spec/blob/master/spec.md#volumes-top-level-element