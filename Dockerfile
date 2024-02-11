FROM node:16.20.1
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app
EXPOSE 3000
CMD ["npm", "run", "start"]
