FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD [ "npm", "run", "serve" ]
# menambahkan metadata ke image agar terkoneksi dengan repository
LABEL org.opencontainers.image.source=https://github.com/fbpr/a433-microservices