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

variable "region" {
  type    = string
  default = "us-east-1"
}
