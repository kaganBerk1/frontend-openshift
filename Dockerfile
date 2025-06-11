FROM node:18 as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

USER 1001
