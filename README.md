# GLPI Ticketing System Lab

Docker Compose lab for running a self-hosted GLPI helpdesk with the official GLPI image, MariaDB, persistent storage, and an internal-only database network.

> Status: IT support / systems administration portfolio lab. The repo contains the repeatable Docker setup; the companion write-up documents the manual GLPI implementation, troubleshooting, sample tickets, roles, locations, assets, and reporting workflow.

## Problem Statement

Small IT teams need a reliable way to track support requests, assign ownership, manage assets, and measure response times. This project shows how I set up GLPI as a practical ITSM/helpdesk environment and packaged the core runtime with Docker Compose for repeatable local testing.

## Companion Write-Up

Full implementation story:

[From Zero to Helpdesk Hero: Building an Enterprise IT Support System with GLPI](https://dev.to/darestack/from-zero-to-helpdesk-hero-building-an-enterprise-it-support-system-with-glpi-hpe)

The article covers the manual setup path, including web server troubleshooting, PHP-FPM socket issues, GLPI security warnings, FakeCorp sample organization design, ticket examples, user roles, asset tracking, location-based routing, SLA tracking, and reporting.

## Architecture

```text
Browser
  |
  v
GLPI container
  |  port 8080 -> container port 80
  |
  v
MariaDB container
  |
  v
Docker named volume: glpi_db

GLPI uploaded files and application data:
Docker named volume: glpi_data
```

MariaDB is not exposed on a host port. Only the GLPI container can reach it over the Docker network.

## Tech Stack

- Official `glpi/glpi` Docker image
- MariaDB 10.11
- Docker
- Docker Compose
- Named Docker volumes

## What This Demonstrates

- Self-hosted ITSM/helpdesk runtime using Docker Compose.
- Persistent database and GLPI application data storage.
- Environment-based database credentials through `.env`.
- Internal service networking with only GLPI exposed to the host.
- Database health check before GLPI startup.
- Practical IT support workflow design: users, roles, tickets, categories, assets, locations, SLA examples, and reporting notes.

## Quick Start

Prerequisites:

- Docker
- Docker Compose

```bash
git clone https://github.com/darestack/glpi-ticketing-system.git
cd glpi-ticketing-system
cp .env.example .env
docker compose up -d
```

Open GLPI:

```text
http://localhost:8080
```

Default GLPI credentials are created by the upstream image. Change them immediately after first login.

Database credentials are read from `.env`; do not commit real secrets.

## Repository Files

```text
docker-compose.yml   GLPI and MariaDB service definitions
.env.example         Local environment variable template
docs/evidence-checklist.md  Screenshots and proof checklist
docs/operations-runbook.md  Backup, restore, and smoke-test notes
scripts/backup-db.sh        MariaDB logical backup helper
scripts/restore-db.sh       MariaDB restore helper
scripts/smoke-test.sh       Container and HTTP smoke test
README.md            Project scope, setup, and evidence notes
```

## Evidence Already Available

- Docker Compose runtime definition in this repo.
- Local GLPI workflow screenshots captured on May 10, 2026:
  - [Ticket list with sample incident](docs/screenshots/glpi-ticket-list.png)
  - [Sample incident ticket](docs/screenshots/glpi-sample-ticket.png)
  - [Computer asset inventory](docs/screenshots/glpi-computer-inventory.png)
  - [Sample computer asset](docs/screenshots/glpi-sample-asset.png)
  - [Sample service level](docs/screenshots/glpi-sample-service-level.png)
  - [Ticket statistics dashboard](docs/screenshots/glpi-statistics.png)
- Local smoke evidence captured on May 9, 2026:
  - [GLPI login screen](https://github.com/darestack/darestack/blob/main/docs/evidence/glpi-login.png)
  - [GLPI dashboard](https://github.com/darestack/darestack/blob/main/docs/evidence/glpi-dashboard.png)
  - [Smoke run note](https://github.com/darestack/darestack/blob/main/docs/evidence/glpi-smoke-2026-05-09.md)
- Companion article documenting the manual implementation and troubleshooting path.
- Article examples include sample tickets, role setup, asset tracking, locations, SLA/reporting exploration, and GLPI security hardening notes.
- Operations runbook with smoke-test, backup, and restore commands.

## Evidence Still Needed In This Repo

- Redacted `.env` setup notes.
- Backup and restore command output for MariaDB.
- Upgrade notes for GLPI image/version changes.
- Optional role/user screenshots if the lab is rebuilt with a fuller fake-company dataset.

Use [docs/evidence-checklist.md](docs/evidence-checklist.md) and [docs/operations-runbook.md](docs/operations-runbook.md) before presenting the project in interviews.

## Known Limitations

- This is a local lab, not a hardened production deployment.
- The Compose file uses the official `glpi/glpi:latest` image for easy lab setup; pin a version or digest before using this outside a lab.
- TLS, email ingestion, SSO/LDAP, backups, monitoring, and off-host storage are not configured yet.
- GLPI business configuration is documented in the article, but not exported as reproducible configuration in this repo.

## Next Improvements

- Pin the GLPI image version.
- Add backup and restore evidence under `docs/`.
- Add a production-hardening section covering TLS, mail collectors, scheduled backups, and access control.
