# Build aşaması
FROM node:18-alpine as build

WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install
COPY . .
RUN npm run build

# Production aşaması
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Opsiyonel: nginx default konfigürasyonu değiştirebilirsin
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
