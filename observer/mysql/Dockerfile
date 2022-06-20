FROM ubuntu/mysql

ARG REPOSITORY=https://github.com/openbroadcaster/observer.git
ENV REPOSITORY=$REPOSITORY

WORKDIR /app

RUN apt-get update -y && apt-get install -y git

ARG COMMIT
ENV COMMIT=$COMMIT

RUN git clone $REPOSITORY .
RUN git checkout $COMMIT

RUN cp ./db/dbclean.sql /docker-entrypoint-initdb.d/dbclean.sql

RUN rm -rf /app

EXPOSE 3306
