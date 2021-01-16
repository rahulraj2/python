FROM rahulraj/python:3.7-py-slim-pkg-gitssh
RUN apt-get update
RUN apt-get install -y envconsul