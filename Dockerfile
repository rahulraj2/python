FROM python:3.7-slim
WORKDIR app
RUN apt-get update 
RUN apt-get install gcc -y \
&& apt-get install -y unixodbc-dev \
&& apt-get install -y python-pip \
&& pip install --upgrade pip \
&& apt-get  clean
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
CMD ["flask","-h 0.0.0.0","-p 5000","app.py"]