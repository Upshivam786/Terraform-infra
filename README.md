# Terraform Infrastructure Repository

Enterprise-grade Terraform repository for managing scalable cloud infrastructure on GCP.

This repository follows a modular architecture with isolated environments and reusable infrastructure modules.

---

# Repository Architecture

```text
terraform-infra/
│
├── modules/
│   ├── vm/
│   ├── vpc/
│   ├── iam/
│   ├── firewall/
│   ├── kafka/
│   ├── clickhouse/
│   ├── postgres/
│   ├── monitoring/
│   └── storage/
│
├── environments/
│   ├── dev/
│   │   ├── network/
│   │   ├── compute/
│   │   ├── kafka/
│   │   ├── clickhouse/
│   │   ├── postgres/
│   │   └── monitoring/
│   │
│   ├── stage/
│   │   ├── network/
│   │   ├── compute/
│   │   ├── kafka/
│   │   └── postgres/
│   │
│   └── prod/
│       ├── network/
│       ├── compute/
│       ├── kafka/
│       ├── clickhouse/
│       ├── postgres/
│       └── monitoring/
│
├── shared/
│   ├── versions.tf
│   ├── providers.tf
│   └── locals.tf
│
├── .gitignore
└── README.md
```

---

# Infrastructure Design Philosophy

This repository is designed using:

- Modular Terraform architecture
- Environment isolation
- Reusable infrastructure components
- Independent deployments
- Separate state management
- Enterprise scalability

---

# Core Concepts

## Modules

`modules/` contains reusable infrastructure templates.

Examples:

- VM creation
- VPC creation
- IAM configuration
- Firewall rules
- Kafka infrastructure
- ClickHouse infrastructure

These modules are reusable across all environments.

---

## Environments

`environments/` contains actual deployments.

Examples:

- dev
- stage
- prod

Each environment is isolated and independently manageable.

---

# Environment Structure

Each environment contains independent infrastructure components.

Example:

```text
dev/
 ├── network
 ├── compute
 ├── kafka
 ├── clickhouse
 └── postgres
```

This allows isolated execution.

Example:

```bash
cd environments/dev/network
terraform apply
```

Only the network infrastructure is deployed.

---

# Terraform Workflow

Terraform works using:

```text
Desired State vs Current State
```

Infrastructure is declared as code.

Terraform automatically:

- creates resources
- updates resources
- destroys removed resources

---

# Deployment Workflow

## Deploy Network

```bash
cd environments/dev/network
terraform init
terraform plan
terraform apply
```

---

## Deploy Compute Infrastructure

```bash
cd environments/dev/compute
terraform init
terraform plan
terraform apply
```

---

## Deploy Kafka Infrastructure

```bash
cd environments/dev/kafka
terraform apply
```

---

# Multi-VM Architecture

VMs are dynamically created using:

```hcl
for_each
```

Example:

```hcl
vms = {
  api = {}
  kafka = {}
  clickhouse = {}
}
```

Terraform automatically creates multiple VMs.

---

# Current Planned Infrastructure

This repository is designed to manage:

- VPCs
- Subnets
- Firewall Rules
- VM Instances
- IAM Roles
- Kafka Infrastructure
- ClickHouse Infrastructure
- PostgreSQL Infrastructure
- Monitoring Stack
- Storage Buckets
- CI/CD Infrastructure

---

# Remote State Architecture

Terraform state will be stored remotely using:

- Google Cloud Storage (GCS)

Benefits:

- Team collaboration
- State locking
- Backup and recovery
- CI/CD compatibility
- Safe production deployments

---

# Security Best Practices

This repository follows:

- Least privilege IAM
- Remote state storage
- No secrets in Git
- Environment isolation
- Modular deployments
- Infrastructure versioning

---

# Git Ignore Rules

The following files are intentionally ignored:

```text
.terraform/
*.tfstate
*.tfstate.*
.terraform.lock.hcl
```

These files should never be committed.

---

# Future Enhancements

Planned future integrations:

- Terragrunt
- GitHub Actions CI/CD
- Secret Manager
- Auto Scaling
- Monitoring & Alerting
- Kubernetes / GKE
- Disaster Recovery
- Multi-region deployment

---

# Repository Goal

The goal of this repository is to provide:

- scalable infrastructure automation
- reusable Terraform modules
- enterprise-grade infrastructure management
- production-safe deployments
- analytics platform automation

---

# Author

Maintained by Shivam Upadhyay.
