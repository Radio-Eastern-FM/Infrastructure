FROM node:14
ENV PORT 3080

WORKDIR /app
COPY ./package.json ./package-lock.json /app/

RUN npm ci

COPY . /app/

EXPOSE ${PORT}
CMD [ "npm", "start" ]
