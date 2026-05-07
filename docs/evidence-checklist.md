# Evidence Checklist

Use this checklist before presenting the repo in an interview or portfolio review.

## Runtime Proof

- `docker compose ps` showing `glpi` and `glpi_db` running.
- Browser screenshot of `http://localhost:8080`.
- Screenshot showing MariaDB has no host port exposed.

## IT Support Workflow Proof

- GLPI dashboard screenshot.
- Sample incident ticket with category, priority, assignee, and status.
- Asset inventory screenshot with at least one linked ticket.
- User role screenshot for technician or manager access.
- SLA or reporting screenshot showing ticket response/resolution tracking.

## Operations Proof

- Backup command for the MariaDB volume.
- Restore test output showing GLPI can read the restored database.
- Upgrade note for changing the GLPI image tag.
- Hardening note covering TLS, mail ingestion, and credential rotation.

## Redaction Rules

- Hide real user emails, passwords, API tokens, and internal hostnames.
- Use fake company/user data for screenshots.
- Keep enough UI context visible so reviewers can understand what was configured.
