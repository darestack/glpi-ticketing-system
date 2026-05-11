# Evidence Checklist

Use this checklist before presenting the repo in an interview or portfolio review.

## Runtime Proof

- `docker compose ps` showing `glpi` and `glpi_db` running.
- Browser screenshot of `http://localhost:8080` or the alternate local port used during the run.
- Screenshot showing MariaDB has no host port exposed.

## IT Support Workflow Proof

- GLPI dashboard screenshot: captured in the profile evidence repo.
- Sample incident ticket: `docs/screenshots/glpi-sample-ticket.png`.
- Ticket list with the sample incident: `docs/screenshots/glpi-ticket-list.png`.
- Asset inventory and sample computer asset:
  - `docs/screenshots/glpi-computer-inventory.png`
  - `docs/screenshots/glpi-sample-asset.png`
- Service-level setup:
  - `docs/screenshots/glpi-sample-service-level.png`
  - `docs/screenshots/glpi-service-levels.png`
- Ticket reporting view: `docs/screenshots/glpi-statistics.png`.
- Still useful to add later: technician/manager role screenshot and a ticket linked directly to an asset.

## Operations Proof

- Backup command for the MariaDB volume.
- Restore test output showing GLPI can read the restored database.
- Upgrade note for changing the GLPI image tag.
- Hardening note covering TLS, mail ingestion, and credential rotation.

## Redaction Rules

- Hide real user emails, passwords, API tokens, and internal hostnames.
- Use fake company/user data for screenshots.
- Keep enough UI context visible so reviewers can understand what was configured.
