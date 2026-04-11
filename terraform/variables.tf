variable "env" {
  type    = string
  default = "dev"
}

variable "cluster_version" {
  type    = string
  default = "v35"
}

variable "eks_cluster_name" {
  type    = string
  default = "cluster-name"
}

variable "eks_cluster_version" {
  type    = string
  default = "1.35"
}

variable "region" {
  type    = string
  default = "us-east-1"
}
