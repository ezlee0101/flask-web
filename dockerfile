FROM ubuntu:24.04

LABEL maintainer="Esther lee <elee26@cmc.edu>"


RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev python3-venv

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN python3 -m venv venv &&\
  venv/bin/pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "/app/venv/bin/python3" ]

CMD [ "app.py" ]
