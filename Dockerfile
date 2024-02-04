# #stage-1
# # FROM node:20.11.0-alpine3.18 AS builder
# FROM node:19.5.0-alpine
# WORKDIR /app
# ADD . /app
# COPY package*.json /app/
# RUN npm install
# RUN npm run build

# EXPOSE 8484

# CMD ["nginx", "-g", "daemon off;"]

FROM node:20.11.0-alpine3.18 as builder
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app
RUN npm run build

################

FROM nginx:alpine as production
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
