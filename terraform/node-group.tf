resource "aws_eks_node_group" "private" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "private-node-group-${var.env}"
  node_role_arn   = aws_iam_role.node-group.arn
  subnet_ids      = local.subnets

  labels          = {
    "type" = "private"
  }

  instance_types = local.instance_type

  scaling_config {
    desired_size = local.asg_desired_capacity
    max_size     = local.asg_max_size
    min_size     = local.asg_min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.node-group-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node-group-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node-group-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.node-group-AmazonSSMManagedInstanceCore,
    aws_iam_role_policy_attachment.node-group-CloudWatchAgentServerPolicy
  ]

  tags = {
    Environment = var.env
  }
}
