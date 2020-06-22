FROM node:10-alpine

EXPOSE 3000

WORKDIR /usr/app
RUN apk add --no-cache python3-dev freetype-dev ca-certificates
COPY requirements.txt ./
RUN pip3 install --upgrade setuptools pip
RUN apk add --no-cache --virtual .build-deps gcc make libc-dev g++ \
&& pip3 install Cython==0.29.15 \
&& pip3 install -r requirements.txt \
&& apk del .build-deps