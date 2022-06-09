FROM node:14 AS builder

# set working directory
WORKDIR /app

RUN git clone https://github.com/Radio-Eastern-FM/Studio-Dashboard.git .

RUN npm ci

RUN npm run build

#Stage 2
#######################################
FROM nginx

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/build .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
