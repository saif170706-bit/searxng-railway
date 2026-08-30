#!/bin/sh
# Railway sætter $PORT dynamisk — send den videre til SearXNG/uwsgi
exec uwsgi \
  --http "0.0.0.0:${PORT:-8080}" \
  --master \
  --processes 4 \
  --threads 2 \
  --module "searx.webapp:application" \
  --static-map "/static=/usr/local/searxng/searx/static" \
  --static-map "/favicon.ico=/usr/local/searxng/searx/static/themes/simple/img/favicon.png"
