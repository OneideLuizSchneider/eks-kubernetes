variable "env" {
  type    = string
  default = "staging"
}

variable "cluster_version" {
  type    = string
  default = "v31"
}

variable "eks_cluster_name" {
  type    = string
  default = "cluster-name"
}

variable "eks_cluster_version" {
  type    = string
  default = "1.31"
}

locals {
  access_key = "..."
  secret_key = "..."
  region     = "..."

  vpc_id            = "..."
  subnets           = ["..."]
  internal_ip_range = "0.0.0.0/0"

  eks_version               = var.eks_cluster_version
  cluster_name              = "${var.eks_cluster_name}-${var.env}-${var.cluster_version}"
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  asg_desired_capacity      = 1
  asg_max_size              = 2
  asg_min_size              = 1
  instance_type             = ["..."]
}
