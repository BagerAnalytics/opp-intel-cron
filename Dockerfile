FROM alpine:3.19
RUN apk add --no-cache curl
# opportunity-desk-feed runs here as a fallback: its dedicated hourly cron
# (opp-intel-opportunity-desk) has been crashing intermittently before the
# request reaches the API, so this daily call keeps it covered in the meantime.
# easygrant has no dedicated standalone cron at all — it only runs here,
# since standalone cron services on this project have shown intermittent
# silent-failure issues, unlike this service's long, proven-reliable track record.
CMD ["sh", "-c", "curl -sf -X POST \"https://opp-intel-api-production.up.railway.app/cron/scrape\" -H \"X-Cron-Secret: $CRON_SECRET\" && curl -sf -X POST \"https://opp-intel-api-production.up.railway.app/cron/opportunity-desk-feed\" -H \"X-Cron-Secret: $CRON_SECRET\" && curl -sf -X POST \"https://opp-intel-api-production.up.railway.app/cron/easygrant\" -H \"X-Cron-Secret: $CRON_SECRET\" && curl -sf -X POST \"https://opp-intel-api-production.up.railway.app/cron/enrich-contacts\" -H \"X-Cron-Secret: $CRON_SECRET\""]
