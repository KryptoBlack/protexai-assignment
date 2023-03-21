FROM python:3.10

RUN mkdir /app
WORKDIR /app

# install python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# install opencv dependencies
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y

COPY main.py annotations.json /app/

ENTRYPOINT [ "python", "main.py" ]
