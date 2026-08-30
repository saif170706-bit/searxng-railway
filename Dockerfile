FROM searxng/searxng:latest

# Kopier vores settings ind i containeren
COPY settings.yml /etc/searxng/settings.yml

# Railway sender trafik til $PORT — dette script sørger for at SearXNG lytter der
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
