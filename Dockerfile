FROM searxng/searxng:latest

# Kopier kun settings — brug det officielle images entrypoint uændret
COPY settings.yml /etc/searxng/settings.yml
