FROM node:16.20.1
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . /app
RUN export SKIP_PREFLIGHT_CHECK=true
EXPOSE 3000
RUN npm run build
CMD ["npm", "run", "start"]
