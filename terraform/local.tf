locals {
  access_key = "..."
  secret_key = "..."
  region     = "${var.region}"

  vpc_id            = "..."
  subnets           = ["..."]
  internal_ip_range = "0.0.0.0/0"

  eks_version               = "${var.eks_cluster_version}"
  cluster_name              = "${var.eks_cluster_name}-${var.env}-${var.cluster_version}"
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  asg_desired_capacity      = 1
  asg_max_size              = 2
  asg_min_size              = 1
  instance_type             = ["..."]
}