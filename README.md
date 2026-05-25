# opp-intel-cron

Railway cron service for the Premier Agric Opportunity Intelligence Tool.

This repo exists solely to give Railway a deployable source.
The actual work is performed by the Custom Start Command configured
in the Railway service settings:

```
curl -sf -X POST $APP_URL/cron/scrape -H "X-Cron-Secret: $CRON_SECRET"
```

## Schedule

Runs daily at **06:00 UTC** (`0 6 * * *`).

## Environment variables required

| Variable | Description |
|---|---|
| `APP_URL` | Base URL of the opp-intel-api Railway service |
| `CRON_SECRET` | Shared secret matching the API service's `CRON_SECRET` |
| `RAILWAY_CRON_SCHEDULE` | `0 6 * * *` |

## What it does

Calls `POST /cron/scrape` on the main API, which dispatches all registered
portal scrapers. No scrapers are registered in W1-2; they are added in W3-4.
