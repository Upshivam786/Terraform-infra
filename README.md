## End-to-End Deployment Flow

![Deployment](docs/images/architecture.png)

# terraform-infra

Production-style GCP infrastructure built with Terraform — modular, environment-isolated, and scalable.

## Overview

This repository provisions a complete cloud infrastructure on Google Cloud Platform using Infrastructure as Code. Every resource is managed through reusable Terraform modules with separate remote state per environment.

```
Internet → Load Balancer → Managed Instance Group → VM (Docker App)
```

## Architecture

```
terraform-infra/
├── environments/
│   ├── dev/
│   │   ├── network/           # VPC + Subnet
│   │   ├── firewall/          # Firewall rules
│   │   ├── compute/           # VM instances
│   │   ├── iam/               # Service accounts + roles
│   │   ├── secrets/           # Secret Manager
│   │   ├── image/             # Golden disk image
│   │   ├── instance-template/ # MIG template
│   │   ├── instance-group/    # Managed Instance Group
│   │   ├── load-balancer/     # HTTP Load Balancer
│   │   └── artifact-registry/ # Docker image registry
│   ├── stage/
│   └── prod/
│
├── modules/
│   ├── vpc/
│   ├── firewall/
│   ├── vm/
│   ├── iam/
│   ├── service_account/
│   ├── secret_manager/
│   ├── image/
│   ├── instance_template/
│   ├── instance_group/
│   ├── load_balancer/
│   └── artifact_registry/
│
└── shared/
    └── versions.tf
```

## Infrastructure Flow

```
VPC + Subnet
     ↓
Firewall Rules (SSH/HTTP/HTTPS)
     ↓
VM (Debian + Docker + startup script)
     ↓
Golden Disk Image (immutable snapshot)
     ↓
Instance Template (reusable VM definition)
     ↓
Managed Instance Group (auto-heal + auto-scale)
     ↓
HTTP Load Balancer (health check + backend + proxy)
     ↓
Artifact Registry (Docker image storage)
```

## Stack

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| Google Cloud Platform | Cloud provider |
| GCE (Compute Engine) | Virtual machines |
| GCS | Remote Terraform state |
| Secret Manager | Credentials storage |
| Artifact Registry | Docker image registry |
| Managed Instance Group | Auto-healing + scaling |
| HTTP Load Balancer | Traffic distribution |

## Key Design Decisions

**Modular Terraform** — Every resource type is a reusable module. Adding a new VM or firewall rule means calling the module with different variables, not rewriting code.

**Environment isolation** — `dev`, `stage`, and `prod` are completely separate. Each has its own state file, variables, and resources. A change in dev never touches prod.

**Remote state** — All Terraform state is stored in GCS (`gs://shivam-terraform-state/`). No local state files committed to Git.

**Least privilege IAM** — Service accounts are scoped to exactly what they need. The API service account has Secret Manager access. The same account is used by Bitbucket to push Docker images to Artifact Registry.

**Immutable infrastructure** — VMs are never modified in place. Changes produce a new golden image → new instance template → rolling MIG update.

**Static IP** — External IP is reserved separately from the VM so it survives VM recreation.

## Remote State

Each environment module has its own state prefix:

```
gs://shivam-terraform-state/dev/network
gs://shivam-terraform-state/dev/compute
gs://shivam-terraform-state/dev/firewall
gs://shivam-terraform-state/dev/iam
gs://shivam-terraform-state/dev/artifact-registry
```

## Secrets

Secrets are stored in GCP Secret Manager — never in `.tfvars` or code:

- `mongo-uri`
- `jwt-secret`
- `db-password`

Access is granted via IAM role `roles/secretmanager.secretAccessor` on the service account.

## How to Use

### Prerequisites

- Terraform >= 1.0
- `gcloud` CLI authenticated
- GCS bucket for state (`shivam-terraform-state`)

### Deploy network

```bash
cd environments/dev/network
terraform init
terraform plan
terraform apply
```

### Deploy in order

```bash
# 1. Network first
cd environments/dev/network && terraform apply

# 2. Firewall
cd environments/dev/firewall && terraform apply

# 3. IAM
cd environments/dev/iam && terraform apply

# 4. Secrets
cd environments/dev/secrets && terraform apply

# 5. Artifact Registry
cd environments/dev/artifact-registry && terraform apply

# 6. Compute
cd environments/dev/compute && terraform apply

# 7. Image (after VM is set up)
cd environments/dev/image && terraform apply

# 8. Instance Template
cd environments/dev/instance-template && terraform apply

# 9. Instance Group
cd environments/dev/instance-group && terraform apply

# 10. Load Balancer
cd environments/dev/load-balancer && terraform apply
```

### Destroy in reverse order

```bash
cd environments/dev/load-balancer && terraform destroy
cd environments/dev/instance-group && terraform destroy
cd environments/dev/instance-template && terraform destroy
cd environments/dev/image && terraform destroy
cd environments/dev/compute && terraform destroy
```

## CI/CD Integration

This infra is paired with the [frontend-app](https://bitbucket.org/upshivam786/frontend-app) repo which runs a Bitbucket Pipeline to:

1. Build a Docker image
2. Push it to Artifact Registry (`asia-south1-docker.pkg.dev/bluet-terra/frontend-images/frontend-app`)
3. SSH into the Terraform-provisioned VM and deploy the latest container

## Security Notes

- No credentials committed to this repository
- Service account keys stored in Bitbucket Secured Variables only
- `.gitignore` excludes `*.json`, `*.tfvars` overrides, and local state files
- All secrets accessed via Secret Manager at runtime

## Roadmap

- [ ] HTTPS with managed SSL certificate
- [ ] Cloud Armor (WAF)
- [ ] NAT Gateway
- [ ] Bastion host
- [ ] Cloud Monitoring + Alerts
- [ ] GitHub Actions for Terraform CI/CD (`fmt` → `validate` → `plan` → `apply`)
- [ ] Blue/Green deployment via MIG
- [ ] GKE migration
- [ ] Packer for golden image builds
- [ ] DNS with Cloud DNS

## Concepts Learned

- Terraform remote state and state drift
- Modular IaC design
- GCP networking (VPC, subnets, firewall)
- Immutable infrastructure with golden images
- Managed Instance Groups and auto-healing
- HTTP Load Balancer components (health check, backend service, URL map, proxy, forwarding rule)
- IAM least privilege model
- Secret Manager integration
- Artifact Registry for Docker images
- CI/CD pipeline integration with cloud infrastructure
