output "cluster_name" {
  value = module.eks.cluster_name
}
output "region" {
  value = var.region
}
output "private_subnets" {
  value = module.vpc.private_subnets
}
