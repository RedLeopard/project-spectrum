module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  enable_irsa     = true

  # VPC wiring
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Public API for this lab (tighten later)
  cluster_endpoint_public_access       = true
  cluster_endpoint_private_access      = false
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  eks_managed_node_groups = {
    default = {
      min_size       = 1
      max_size       = 3
      desired_size   = 2
      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
    }
  }

  # 🔐 Map your IAM user to cluster-admin using EKS access policies
  access_entries = {
    spectrum_admin_user = {
      principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/spectrum-admin"

      policy_associations = {
        admin = {
          policy_arn   = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = { type = "cluster" }
        }
      }
    }
  }

  tags = {
    Project   = "ProjectSpectrum"
    ManagedBy = "Terraform"
    Env       = "dev"
  }
}
