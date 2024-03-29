FROM rahulraj/python:3.7-py-stretch-pkg as build
WORKDIR /app
RUN apt-get update 
RUN apt-get install gcc -y \
&& apt-get install -y unixodbc-dev \
&& apt-get install -y python-pip \
&& pip3 install --upgrade pip \
&& apt-get  clean
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
RUN pyinstaller --onefile --hidden-import=pkg_resources.py2_warn app.py
ENV PATH=$PATH:/app/dist/
RUN chmod 777 /app/dist/*
RUN chmod 777 /app/dist/app


FROM gcr.io/distroless/python3-debian11
WORKDIR /demo
USER root
COPY --from=build /bin /bin
COPY --from=build /app/dist/app /demo/app
COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
ENV PATH=$PATH:/demo/
EXPOSE 5000
ENTRYPOINT [ "python" ]
