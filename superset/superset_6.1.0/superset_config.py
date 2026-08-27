import os

SQLALCHEMY_DATABASE_URI = os.environ.get(
    "SUPERSET_DATABASE_URI",
    "postgresql+psycopg2://root:root@10.211.0.31:5999/root"
)

SECRET_KEY = os.getenv(
    "SUPERSET_SECRET_KEY",
    "NPCRk8sO0/gpYemOisMcPV6AKUNd+xTA9zIZaD4IeNO/uL2Uq/kMBN4"
)

TALISMAN_CONFIG = {
    "content_security_policy": {
        "base-uri": ["'self'"],
        "default-src": ["'self'"],
        "img-src": [
            "'self'",
            "blob:",
            "data:",
            "https://apachesuperset.gateway.scarf.sh",
            "https://static.scarf.sh/",
            "ows.terrestris.de",
            "https://cdn.document360.io",
        ],
        "worker-src": ["'self'", "blob:"],
        "connect-src": [
            "'self'",
            "https://api.mapbox.com",
            "https://events.mapbox.com",
            "https://tile.openstreetmap.org",
            "https://tile.osm.ch",
            "https://a.basemaps.cartocdn.com",
        ],
        "object-src": "'none'",
        "style-src": [
            "'self'",
            "'unsafe-inline'",
            "https://fonts.googleapis.com",
            "https://fonts.gstatic.com",
            "https://use.typekit.net",
            "https://use.typekit.com",
        ],
        "font-src": [
            "'self'",
            "https://fonts.googleapis.com",
            "https://fonts.gstatic.com",
            "https://use.typekit.net",
            "https://use.typekit.com",
        ],
        "script-src": [
            "'self'",
            "'strict-dynamic'",
            "'unsafe-eval'",
        ],
    },
    "content_security_policy_nonce_in": ["script-src"],
    "force_https": False,
    "session_cookie_secure": False,
}