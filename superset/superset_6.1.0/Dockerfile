FROM apache/superset:6.1.0

USER root

COPY superset_config.py /app/pythonpath/superset_config.py

RUN uv pip install --target /app/.venv/lib/python3.10/site-packages \
    psycopg2-binary py-postgresql sqlalchemy-drill pyarrow

USER superset

ENV SUPERSET_CONFIG_PATH=/app/pythonpath/superset_config.py