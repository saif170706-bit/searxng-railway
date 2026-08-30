#!/bin/sh
# Indsæt secret key fra Railway env-variabel i settings.yml ved startup
# (Selve nøglen lever i Railway Variables — aldrig i git)
if [ -n "$SEARXNG_SECRET_KEY" ]; then
  sed -i "s|REPLACE_SECRET_KEY_AT_RUNTIME|${SEARXNG_SECRET_KEY}|g" /etc/searxng/settings.yml
fi

# Kald det officielle SearXNG entrypoint (håndterer granian/uwsgi startup)
exec /usr/local/searxng/dockerfiles/docker-entrypoint.sh "$@"
