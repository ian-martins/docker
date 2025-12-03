FROM debian:12

RUN apt update && apt upgrade -y

RUN apt install -y \
    python3 python3-pip python3-venv curl git \
    libbz2-dev build-essential libssl-dev libffi-dev \
    libsasl2-dev libldap2-dev default-libmysqlclient-dev \
    wget libpq-dev libsqlite3-dev libxml2-dev libxslt1-dev \
    zlib1g-dev libjpeg-dev libpng-dev && \
    apt clean

WORKDIR /app

RUN python3 -m venv env && \
    /app/env/bin/pip install --upgrade pip setuptools wheel pillow && \
    /app/env/bin/pip install apache-superset sqlalchemy-drill pyarrow && \
    /app/env/bin/pip install marshmallow==3.20.1

ENV SUPERSET_SECRET_KEY="gIqInPWqUbOEMg5uecTFP5D0gq9Bb0ze/M1po4ylBdvcLfu1lmhtngzp"
ENV FLASK_APP=superset
ENV PATH="/app/env/bin:$PATH"


RUN superset db upgrade && \
    superset fab create-admin \
    --username admin \
    --firstname Admin \
    --lastname User \
    --email admin@admin \
    --password admin && \
    superset init

COPY superset-logo-horiz.png /app/env/lib/python3.11/site-packages/superset/static/assets/images/superset-logo-horiz.png

EXPOSE 8088
CMD ["superset", "run", "-p", "8088", "-h", "0.0.0.0"]
