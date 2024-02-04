#stage-1
FROM node:20.11.0-alpine3.18 AS builder
WORKDIR /app
ADD . /app
COPY package*.json /app/
RUN npm install
RUN npm run build

EXPOSE 8484

CMD ["nginx", "-g", "daemon off;"]