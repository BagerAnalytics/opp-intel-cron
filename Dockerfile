FROM alpine:3.19
RUN apk add --no-cache curl
CMD ["sh", "-c", "curl -sf -X POST \"https://opp-intel-api-production.up.railway.app/cron/scrape\" -H \"X-Cron-Secret: $CRON_SECRET\" && curl -sf -X POST \"https://opp-intel-api-production.up.railway.app/cron/enrich-contacts\" -H \"X-Cron-Secret: $CRON_SECRET\""]
