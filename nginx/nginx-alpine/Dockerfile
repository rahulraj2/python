FROM nginx:stable-alpine

WORKDIR /app

RUN apk update

RUN sed -i 's/DEFAULT@SECLEVEL=2/ALL@SECLEVEL=1/g' /etc/ssl/openssl.cnf

RUN apk add nginx-mod-http-headers-more

COPY nginx.conf /etc/nginx/nginx.conf