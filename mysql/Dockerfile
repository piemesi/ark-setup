FROM tutum/mysql

#MAINTAINER me

#ENV MYSQL_DATABASE=<schema_name> \
#    MYSQL_ROOT_PASSWORD=<password>

RUN printenv
RUN printenv | grep MYSQL

ADD init.sql /docker-entrypoint-initdb.d

EXPOSE 3306

