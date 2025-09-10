variable "region" {
  type    = string
  default = "us-east-2"
}

variable "cluster_name" {
  type    = string
  default = "project-spectrum"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "budget_limit" {
  type    = string
  default = "50" # USD
}
