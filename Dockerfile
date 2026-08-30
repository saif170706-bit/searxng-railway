FROM searxng/searxng:latest

# Settings med placeholder — secret key indsættes ved runtime fra env
COPY settings.yml /etc/searxng/settings.yml

# Startup-script: indsætter secret key og kalder officielt SearXNG-entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
