# 🌐 Project Spectrum – Hybrid K8s + GitOps (AWS Terraform Portfolio Project)  
This project demonstrates how to provision a **production-ready Amazon EKS (Elastic Kubernetes Service) cluster** using **Terraform**, enhanced with **Argo CD GitOps**, and security features like **IAM roles for service accounts (IRSA)**.  
> 🚀 Designed as part of preparation for the **Principal Engineer I – Multi Cloud Infrastructure** role at Spectrum (Charter Communications).  

---

## 🌟 Features  
- 🧩 **Infrastructure-as-Code** with Terraform  
- ☸️ **EKS Cluster** with managed node groups across multiple AZs  
- 🔐 **IAM Integration (IRSA)** for least-privileged access  
- ⚙️ **Argo CD GitOps** for automated deployments and drift detection  
- 🌐 Configurable **cluster endpoint access (CIDR restrictions)**  
- 💰 **FinOps-aware design** (Spot instances, budget alarms)  
- 📦 Modular, reusable configuration for future expansion  

---

## 🏗️ Architecture Overview  
```mermaid
graph TD
    Terraform --> VPC[VPC + Subnets]
    Terraform --> EKS[Amazon EKS Cluster]
    EKS --> Nodes[Managed Node Group]
    EKS --> Argo[Argo CD (GitOps)]
    Argo --> DemoApp[Demo App via Kustomize]
```  
## 📁 Project Structure 
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
└── README.md                 # This file
🚀 How to Deploy
✅ Clone the Repo
git clone https://github.com/RedLeopard/project-spectrum.git  
cd project-spectrum/infra
🔑 Set up AWS credentials
aws configure
⚙️ Initialize Terraform
terraform init
📐 Review Plan
terraform plan
🚀 Apply Infrastructure
terraform apply -auto-approve
⛅ Access the Cluster
aws eks update-kubeconfig --name project-spectrum --region us-east-2
kubectl get nodes
kubectl get ns
📦 Install Argo CD (GitOps)
kubectl create ns argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd -n argocd
🧩 Deploy Demo App with GitOps
kubectl apply -f ../app-guestbook.yaml
kubectl get applications -n argocd
📸 Visual Evidence
✅ EKS Nodes Ready
<img width="1440" alt="kubectl-get-nodes" src="https://github.com/user-attachments/assets/example-nodes.png" />
✅ Argo CD Apps Synced
<img width="1440" alt="argocd-ui" src="https://github.com/user-attachments/assets/example-argocd.png" />
✅ Terraform Apply Output
<img width="1440" alt="terraform-apply" src="https://github.com/user-attachments/assets/example-terraform.png" />
📦 Coming Soon
🔄 GitHub Actions CI/CD for Argo sync
📈 Auto-scaling with Karpenter
📊 Monitoring with Prometheus + Grafana
📜 Ansible playbook integration (on-prem + hybrid ops)
🤖 Simple ML inference service (MLOps demo)
📜 License
MIT License. Free to fork, reuse, and adapt.
🔗 Built With Pride
Created with ❤️ by Edward Thornton
For the Spectrum Principal Engineer Interview
GitHub Profile • Portfolio

---

### Next Steps
1. Replace your current `README.md` with this:
   ```bash
   cat > README.md <<'EOF'
   # (paste content above here)
   EOF
   git add README.md
   git commit -m "Docs: polished portfolio-style README"
   git push
