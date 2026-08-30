FROM searxng/searxng:latest

# Kopier kun vores settings — brug det officielle images entrypoint
COPY settings.yml /etc/searxng/settings.yml
