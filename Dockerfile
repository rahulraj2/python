FROM rahulraj/python:3.7-py-slim-pkg as build
WORKDIR /app
RUN apt-get update 
RUN apt-get install gcc -y \
&& apt-get install -y unixodbc-dev \
&& apt-get install -y python-pip \
&& pip install --upgrade pip \
&& apt-get  clean
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
COPY . .
RUN pyinstaller app.py
RUN chmod 777 /app/dist/app/*
RUN chmod 777 /app/dist/app/app

FROM gcr.io/distroless/python3
WORKDIR /app
USER root
COPY --from=build /app/dist/app/* /app/
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
ENV PATH=$PATH:/app/
ENTRYPOINT [ "app" ]