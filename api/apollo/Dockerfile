FROM node:14 AS builder

# set working directory
WORKDIR /app

ARG REPOSITORY=https://github.com/Radio-Eastern-FM/API.git
ENV REPOSITORY=$REPOSITORY

ARG COMMIT
ENV COMMIT=$COMMIT

RUN git clone $REPOSITORY .
RUN git checkout $COMMIT

RUN npm ci

ENTRYPOINT ["node", "server.js"]
