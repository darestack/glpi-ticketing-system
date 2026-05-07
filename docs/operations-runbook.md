# GLPI Lab Operations Runbook

This runbook keeps the lab evidence practical: a reviewer should be able to see how the service starts, how the database is backed up, and what still needs hardening before any production use.

## Start The Lab

```bash
cp .env.example .env
docker compose up -d
docker compose ps
```

Open GLPI at:

```text
http://localhost:8080
```

Change default GLPI passwords immediately after first login.

## Smoke Test

```bash
./scripts/smoke-test.sh
```

Expected evidence:

- `glpi` and `glpi_db` are running.
- GLPI returns HTTP `200` or `302`.
- No MariaDB host port is exposed in `docker compose ps`.

## Backup Database

```bash
./scripts/backup-db.sh
```

The backup is written to `backups/glpi-db-<timestamp>.sql`.

## Restore Database

```bash
./scripts/restore-db.sh backups/glpi-db-YYYYMMDDTHHMMSSZ.sql
```

After restore, run the smoke test and log in to confirm tickets, users, and assets are present.

## Before Presenting This As Evidence

- Add a screenshot of `docker compose ps`.
- Add a redacted GLPI dashboard screenshot.
- Add one sample ticket lifecycle screenshot.
- Add one asset inventory screenshot.
- Add one backup and restore command output snippet.

## Production Hardening Not Included

This lab does not configure TLS, mail collectors, SSO/LDAP, off-host backups, monitoring, or upgrade testing. Those are listed as next steps instead of implied.
