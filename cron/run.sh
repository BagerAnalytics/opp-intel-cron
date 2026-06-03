#!/bin/sh
set -e
curl -sf -X POST "$APP_URL/cron/scrape" -H "X-Cron-Secret: $CRON_SECRET"
sleep 1800
curl -sf -X POST "$APP_URL/cron/enrich-contacts" -H "X-Cron-Secret: $CRON_SECRET"
