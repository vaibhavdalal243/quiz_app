# #stage-1
FROM node:18.19.0-alpine3.19 as builder
WORKDIR /app
ADD . /app
COPY package*.json /app/
RUN npm install
RUN npm run build

EXPOSE 8484

CMD ["nginx", "-g", "daemon off;"]

# FROM node:18.19.0-alpine3.19 as builder
# WORKDIR /app
# COPY package*.json /app/
# RUN npm install
# COPY . /app
# RUN npm run build

# ################

# FROM nginx:alpine as production
# COPY --from=builder /app/build /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
