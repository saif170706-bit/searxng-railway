#!/bin/sh
# Erstat ${SEARXNG_SECRET_KEY} i settings.yml med den faktiske env-variabel
# (YAML parser fortolker ikke shell-syntax — vi gør det manuelt)
sed -i "s|\${SEARXNG_SECRET_KEY}|${SEARXNG_SECRET_KEY}|g" /etc/searxng/settings.yml

# Railway sætter $PORT dynamisk
# 1 process + 2 threads = holder sig inden for 0.5 GB RAM
exec uwsgi \
  --http "0.0.0.0:${PORT:-8080}" \
  --master \
  --processes 1 \
  --threads 2 \
  --module "searx.webapp:application" \
  --static-map "/static=/usr/local/searxng/searx/static" \
  --static-map "/favicon.ico=/usr/local/searxng/searx/static/themes/simple/img/favicon.png"
