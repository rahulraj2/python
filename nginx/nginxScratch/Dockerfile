#FROM node as build-stage
#WORKDIR /app
#COPY package*.json /app/
#RUN npm install
#COPY ./ /app/
#RUN npm run build

FROM  alpine:latest as nginx
#Define build argument for version
#ARG VERSION=1.12.0
ARG VERSION=1.19.0
RUN apk upgrade --available
# Install build tools, libraries and utilities 
RUN apk add --no-cache --virtual .build-deps                                        \
        build-base                                                                  \   
        gnupg                                                                       \
        pcre-dev                                                                    \
        wget                                                                        \
        zlib-dev                                                                    \
        musl                                                                        \
        zlib                                                                        \
        jpeg-dev                                                                    \
        libjpeg-turbo-dev                                                           \
        pkgconfig                                                                   \
        libjpeg-turbo                                                               \
        bash
# Retrieve, verify and unpack Nginx source - key server pgp.mit.edu  
RUN set -x                                                                      &&  \
    cd /tmp                                                                     &&  \
    #gpg --keyserver pool.sks-keyservers.net --recv-keys                             \
   #     B0F4253373F8F6F510D42178520A9993A1C052F8                                &&  \
    wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz                   &&  \
    wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz.asc               &&  \
    #gpg --verify nginx-${VERSION}.tar.gz.asc                                    &&  \
    tar -xf nginx-${VERSION}.tar.gz                                             &&  \
    echo ${VERSION}                                           
WORKDIR /tmp/nginx-${VERSION}
# Build and install nginx
RUN ./configure                                                                     \
    #    --with-ld-opt="-static"                                                     \
    #    --with-zlib="/usr/local/nginx/sbin/nginx"                                   \
        --with-http_sub_module                                                  &&  \
    make install                                                                &&  \
    strip /usr/local/nginx/sbin/nginx
# Symlink access and error logs to /dev/stdout and /dev/stderr, in 
# order to make use of Docker's logging mechanism
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log                         &&  \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log                          &&  \
    rm -rf /usr/local/nginx/conf/nginx.conf