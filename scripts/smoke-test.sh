#!/usr/bin/env bash
set -euo pipefail

GLPI_URL="${GLPI_URL:-http://localhost:8080}"

echo "Checking Docker Compose services..."
docker compose ps

echo "Checking GLPI HTTP response at $GLPI_URL ..."
HTTP_CODE="$(curl --silent --show-error --output /dev/null --write-out "%{http_code}" "$GLPI_URL")"

if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "302" ]; then
  echo "Unexpected GLPI HTTP status: $HTTP_CODE" >&2
  exit 1
fi

echo "GLPI responded with HTTP $HTTP_CODE."
