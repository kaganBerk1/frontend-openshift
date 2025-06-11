FROM node:18 as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# OpenShift ile uyumlu hale getirmek için:
RUN chmod -R 777 /var/cache/nginx /var/run /etc/nginx /usr/share/nginx/html

USER 1001
