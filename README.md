# Terraform Infrastructure on Google Cloud

Production-style modular Terraform infrastructure on Google Cloud Platform (GCP).

This repository demonstrates a scalable DevOps/SRE architecture using reusable Terraform modules and environment-based deployments.

---


# Repository Architecture


```
terraform-infra/
├── environments/
│ ├── dev/
│ │ ├── compute/
│ │ ├── firewall/
│ │ ├── iam/
│ │ ├── image/
│ │ ├── instance-group/
│ │ ├── instance-template/
│ │ ├── load-balancer/
│ │ ├── network/
│ │ └── secrets/
│ ├── prod/
│ └── stage/
│
├── modules/
│ ├── firewall/
│ ├── iam/
│ ├── image/
│ ├── instance_group/
│ ├── instance_template/
│ ├── load_balancer/
│ ├── secret_manager/
│ ├── vm/
│ └── vpc/
│
├── shared/
│ └── versions.tf
│
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

---

# Infrastructure Workflow

## 1. Network Creation

Terraform creates:

- VPC
- Subnet
- Firewall Rules

---

## 2. VM Deployment

Terraform provisions VMs using reusable VM modules.

Startup scripts automatically:

- Install Apache
- Configure web server
- Deploy sample application

---

## 3. Golden Image Creation

Configured VM is converted into a reusable custom image.

This image becomes the base for scalable infrastructure.

---

## 4. Instance Template

Terraform creates an Instance Template using the custom image.

Template defines:

- Machine type
- Boot disk
- Network settings
- Tags

---

## 5. Managed Instance Group (MIG)

Terraform creates a regional Managed Instance Group.

Features:

- Auto healing
- Auto recreation
- Scalable instances
- Multi-zone deployment

---

## 6. HTTP Load Balancer

Terraform provisions:

- Health checks
- Backend service
- URL map
- HTTP proxy
- Global forwarding rule

Traffic flow:

nternet
↓
Load Balancer
↓
MIG
↓
VM Instances


---

# Remote Terraform State

Terraform state is stored remotely in Google Cloud Storage (GCS).

Benefits:

- Team collaboration
- State locking
- Centralized infrastructure state
- Safer deployments
- CI/CD friendly architecture

Example:

gs://shivam-terraform-state/dev/network


---

# Secret Management

Secrets are managed using Google Cloud Secret Manager.

Examples:

- Database passwords
- JWT secrets
- MongoDB URI
- API keys

Benefits:

- Secure secret storage
- IAM controlled access
- Avoid hardcoded secrets
- Production-ready security

---

# Example Deployment Commands

## Network

```bash
cd environments/dev/network

terraform init
terraform plan
terraform apply


## Compute

cd environments/dev/compute

terraform init
terraform plan
terraform apply



## Load Balancer
cd environments/dev/load-balancer

terraform init
terraform plan
terraform apply



## Current Stack

Infrastructure currently tested on:

Google Cloud Platform (GCP)
Terraform
Google Compute Engine
Google Cloud Storage
Google Secret Manager
Apache HTTP Server



## Future Improvements

Planned enhancements:

HTTPS Load Balancer
SSL certificates
Cloud DNS
Auto Scaling Policies
CI/CD integration
GitHub Actions
Monitoring & Logging
Bastion Host
Private Subnets
Cloud NAT
Kubernetes (GKE)
Packer image automation
Learning Outcomes

This project demonstrates:

Infrastructure as Code (IaC)
Terraform module design
Cloud networking
Scalable infrastructure
Immutable infrastructure
Production-grade deployment flow
DevOps best practices




## Author

Shivam Upadhyay
