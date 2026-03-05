import os

SECRET_KEY = os.environ.get("SUPERSET_SECRET_KEY", "change-me")

SQLALCHEMY_DATABASE_URI = os.environ.get(
    "SQLALCHEMY_DATABASE_URI",
    "postgresql+psycopg2://superset:superset@10.211.0.31:5432/superset"
)