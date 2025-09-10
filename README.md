# 🌐 Project Spectrum – Hybrid K8s + GitOps (AWS Terraform Portfolio Project)
This project provisions a **production-ready Amazon EKS cluster** with **Terraform**, adds **Argo CD GitOps** for app delivery, and enables **IRSA** for least-privileged IAM to workloads.  
> 🚀 Built as preparation for the **Principal Engineer I – Multi Cloud Infrastructure** role at Spectrum (Charter Communications).

---

## 🌟 Features
- 🧩 Infrastructure-as-Code with Terraform  
- ☸️ Amazon EKS (1.29) with managed node groups across multiple AZs  
- 🔐 IRSA (IAM Roles for Service Accounts) enabled  
- ⚙️ Argo CD GitOps for automated sync & drift detection  
- 🌐 API endpoint CIDR controls (public for dev, restrict later)  
- 💰 FinOps-aware (Spot nodes, easy add for Budgets/Anomaly)  
- 🧰 Modular layout ready for CI, Ansible, and MLOps add-ons  

---

## 🏗️ Architecture Overview
```mermaid
graph TD
    Terraform --> VPC[VPC + Subnets]
    Terraform --> EKS[Amazon EKS Cluster]
    EKS --> Nodes[Managed Node Group]
    EKS --> Argo[Argo CD GitOps]
    Argo --> Demo[Demo App via Kustomize]
project-spectrum/
├── infra/                    # Terraform EKS + VPC configs
│   ├── providers.tf
│   ├── variables.tf
│   ├── vpc.tf
│   ├── eks.tf
│   └── outputs.tf
├── apps/                     # (GitOps) App manifests
│   └── app-guestbook.yaml
├── docs/                     # Architecture + runbooks + ADRs
│   ├── ARCHITECTURE.md
│   ├── RUNBOOK.md
│   └── ADR-0001-why-gitops.md
├── .github/workflows/        # GitHub Actions CI
│   └── terraform.yml
├── .gitignore
└── README.md
