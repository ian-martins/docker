FROM debian:12

RUN apt update && apt install -y \
    python3 python3-pip python3-venv \
    build-essential libssl-dev libffi-dev \
    libpq-dev libjpeg-dev libpng-dev \
    && apt clean

WORKDIR /app

RUN python3 -m venv env && \
    /app/env/bin/pip install --upgrade pip setuptools wheel pillow && \
    /app/env/bin/pip install psycopg2-binary py-postgresql apache-superset sqlalchemy-drill pyarrow && \
    /app/env/bin/pip install marshmallow==3.20.1

ENV SUPERSET_SECRET_KEY="SUPERSET_SECRET_KEY"
ENV FLASK_APP=superset
ENV PATH="/app/env/bin:$PATH"
ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

COPY superset_config.py /app/superset_config.py
COPY superset-logo-horiz.png /app/env/lib/python3.11/site-packages/superset/static/assets/images/superset-logo-horiz.png

CMD ["superset", "run", "-p", "8088", "-h", "0.0.0.0"]