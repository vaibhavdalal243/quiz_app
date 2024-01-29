#stage 1
FROM node:20.11.0-alpine3.18 AS builder
WORKDIR /app
COPY package.json .
# COPY package-lock.json .
RUN npm install
# RUN npm audit fix --force
COPY . .
# RUN npm install -g typescript
# RUN npm run build
EXPOSE 5000

CMD [ "node" "SwDev.js"]