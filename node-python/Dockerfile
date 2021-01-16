FROM node:10-alpine

EXPOSE 3000

WORKDIR /usr/app
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.5/community" >> /etc/apk/repositories \
  && apk update \
  && apk add --update-cache --no-cache libgcc libquadmath musl \
  && apk add --update-cache --no-cache libgfortran \
  && apk add --update-cache --no-cache lapack-dev
RUN apk add --no-cache python3-dev freetype-dev ca-certificates cmake gcc libxml2 \
cmake gcc libxml2 \
libxml2-dev libxslt-dev lapack-dev gfortran

COPY requirements.txt ./
RUN pip3 install --upgrade setuptools pip
RUN pip3 install wheel
RUN apk add --no-cache --virtual .build-deps gcc make libc-dev g++ \
&& pip3 install Cython==0.29.15 \
&& pip3 install -r requirements.txt \
&& apk del .build-deps