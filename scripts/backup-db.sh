#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${1:-backups}"
TIMESTAMP="$(date -u +%Y%m%dT%H%M%SZ)"
BACKUP_FILE="$BACKUP_DIR/glpi-db-$TIMESTAMP.sql"

mkdir -p "$BACKUP_DIR"

echo "Creating GLPI MariaDB backup: $BACKUP_FILE"
docker compose exec -T db sh -c \
  'mariadb-dump -u root -p"$MARIADB_ROOT_PASSWORD" "$MARIADB_DATABASE"' \
  > "$BACKUP_FILE"

echo "Backup complete: $BACKUP_FILE"
