terraform {
  required_version = ">= 0.12.24"
}

variable "env" {
  type = string
  default = "hml"
}

variable "eks_cluster_name" {
  type = string
  default = "eks-cluster-v2"
}

locals{
    access_key = "..."
    secret_key = "..."
    region = "..."

    vpc_id = "..."
    subnets = ["..."]
    internal_ip_range = "0.0.0.0/0"

    eks_version = "..."
    cluster_name = var.eks_cluster_name      
    cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    asg_desired_capacity = 1
    asg_max_size = 3
    asg_min_size = 1
    instance_type = ["..."]
}