FROM nginx:1.19.2

WORKDIR /app

RUN apt-get -y update

RUN sed -i 's/DEFAULT@SECLEVEL=2/ALL@SECLEVEL=1/g' /etc/ssl/openssl.cnf

RUN apt-get install -y nginx-extras