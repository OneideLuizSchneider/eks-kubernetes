//Updating Kubectl Config File
resource "null_resource" "update-kube-config" {

  provisioner "local-exec" {
    command = <<EOT
      aws eks --region ${local.region} update-kubeconfig --name ${local.cluster_name}

      kubectl get nodes
      kubectl get pods -A

    EOT
  }

  depends_on = [
    aws_eks_node_group.private
  ]

}
