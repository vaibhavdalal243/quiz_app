# FROM node:14 as builder
# WORKDIR /app
# COPY package*.json /app/
# RUN npm install
# COPY . /app
# # RUN npm run build
# CMD [ "npm", "start" ]


# # CMD ["nginx", "-g", "daemon off;"]


# ################

# # FROM nginx:alpine as production
# # COPY --from=builder /app/build /usr/share/nginx/html
# # EXPOSE 80
# # CMD ["nginx", "-g", "daemon off;"]

FROM node:14 as builder
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app
RUN npm run build

################

FROM nginx:alpine as production
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 8484
CMD ["nginx", "-g", "daemon off;"]



























# # #stage-1
# FROM node:slim
# WORKDIR /app
# COPY . /app
# # COPY package*.json /app/
# RUN npm install
# # RUN npm run build
# EXPOSE 8484
# CMD node index.js

# # FROM node:18.19.0-alpine3.19 as builder
# # WORKDIR /app
# # COPY package*.json /app/
# # RUN npm install
# # COPY . /app
# # RUN npm run build

# # ################

# # FROM nginx:alpine as production
# # COPY --from=builder /app/build /usr/share/nginx/html
# # EXPOSE 80
# # CMD ["nginx", "-g", "daemon off;"]
