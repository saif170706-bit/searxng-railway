# searxng-railway

Minimal SearXNG deployment til Railway. Trækker fra Google, Bing, DuckDuckGo og Brave på én gang.

## Deploy til Railway

1. Push dette repo til GitHub
2. Gå til [railway.app](https://railway.app) → New Project → Deploy from GitHub
3. Vælg dette repo
4. Under **Settings → Variables** tilføj:
   - `SEARXNG_SECRET_KEY` = `openssl rand -hex 32` (en lang tilfældig streng)
5. Under **Settings → Networking** → Generate Domain
6. Kopiér URL og sæt den som `SEARXNG_URL` i ticket-systemets Railway-variabler

## Test at JSON virker

```
https://din-url.railway.app/search?q=test&format=json
```

Skal returnere JSON med `results`-array.
