# glpi-ticketing-system

> Self-hosted IT helpdesk using GLPI on Docker. Configured with ticket categories,
> asset inventory, SLA rules, and user roles — mirrors a real internal IT support environment.

📖 **Full implementation write-up:** [From Zero to Helpdesk Hero: Building an Enterprise IT Support System with GLPI](https://dev.to/darestack/from-zero-to-helpdesk-hero-building-an-enterprise-it-support-system-with-glpi-hpe)

> **Note:** This repo contains the Docker Compose deployment setup. The complete step-by-step guide — covering installation, asset configuration, SLA setup, user roles, and production hardening — is documented in the article above.

---

## What This Is

GLPI (Gestionnaire Libre de Parc Informatique) is an open-source ITSM platform used in production by thousands of organisations. This deployment demonstrates:

- Standing up a complete helpdesk from a `docker-compose up` command
- Configuring it to mirror a real IT support operation: asset types, ticket categories, SLA policies, user roles (technician / manager / admin)
- Persistent storage for the database and uploaded files

---

## Stack

| Component | Technology |
|---|---|
| ITSM platform | GLPI (latest) |
| Database | MariaDB |
| Containerisation | Docker, Docker Compose |
| Persistent storage | Named Docker volumes |

---

## Quick Start

**Prerequisites:** Docker and Docker Compose installed.

```bash
git clone https://github.com/darestack/glpi-ticketing-system.git
cd glpi-ticketing-system
docker-compose up -d
```

Access GLPI at: **http://localhost:8080**

Default credentials (change immediately after first login):
- Username: `glpi`
- Password: `glpi`

Database credentials are set in `docker-compose.yml` via environment variables.

---

## What Was Configured

### Asset Management
- **Asset types defined**: Workstations, Servers, Network devices, Printers, Mobile devices
- **Fields configured**: Serial number, purchase date, warranty expiry, assigned user, location
- Assets linked to tickets so every incident is traceable to a specific piece of equipment

### Ticket Categories
- Hardware failure
- Software / application issues
- Access and permissions requests
- Network connectivity
- General IT request

### SLA Policies
- **P1 (Critical)**: Response within 1 hour, resolution within 4 hours
- **P2 (High)**: Response within 4 hours, resolution within 1 business day
- **P3 (Normal)**: Response within 1 business day, resolution within 3 business days

### User Roles
| Role | Permissions |
|---|---|
| **End user** | Submit tickets, view own ticket status |
| **Technician** | Accept, update, close tickets; access asset inventory |
| **Manager** | All technician permissions + SLA reporting + user management |
| **Admin** | Full system access including configuration |

---

## Architecture

```
Browser
  └── GLPI container (port 8080)
        └── MariaDB container (internal network only)
              └── glpi_db volume (persistent)
        └── glpi_files volume (uploaded attachments, persistent)
```

The MariaDB container is not exposed on the host — only GLPI can reach it over the internal Docker network.

---

## Key Files

```
glpi-ticketing-system/
├── docker-compose.yml    # Service definitions, volumes, network
├── .env.example          # Environment variable template
└── README.md
```
