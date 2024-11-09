resource "aws_eks_cluster" "eks" {
  name     = "${var.eks_cluster_name}-${var.env}"
  version  = local.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    security_group_ids      = [aws_security_group.eks_cluster.id]
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = [local.internal_ip_range]
    subnet_ids              = local.subnets
  }

  enabled_cluster_log_types = local.cluster_enabled_log_types

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.eks-AmazonEKSServicePolicy
  ]

  tags = {
    Environment = var.env
  }
}