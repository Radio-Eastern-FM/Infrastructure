FROM node:14 AS builder

# set working directory
WORKDIR /app

ARG REPOSITORY=https://github.com/Radio-Eastern-FM/Belt.git
ENV REPOSITORY=$REPOSITORY

ARG COMMIT
ENV COMMIT=$COMMIT

RUN git clone $REPOSITORY .
RUN git checkout $COMMIT

RUN npm ci

RUN npm run build

#Stage 2
#######################################
FROM nginx

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
