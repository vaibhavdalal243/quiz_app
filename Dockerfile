#stage 1
FROM node:18.12.0-alpine3.15 AS builder
WORKDIR /app
COPY package.json .
# COPY package-lock.json .
RUN npm install
# RUN npm audit fix --force
COPY . .
RUN npm install -g typescript
RUN npm run build
