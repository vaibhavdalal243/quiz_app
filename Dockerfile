#stage 1
FROM node:20.11.0-alpine3.18 AS builder
WORKDIR /app
COPY . /app
RUN npm install

EXPOSE 5000

CMD npm start