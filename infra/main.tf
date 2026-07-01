resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = {
    Project     = "ProyectoDespachos"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "workers"

  node_role_arn = var.node_role_arn

  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = var.desired_nodes
    min_size     = var.min_nodes
    max_size     = var.max_nodes
  }

  instance_types = [
    var.node_instance_type
  ]

  tags = {
    Project     = "ProyectoDespachos"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    aws_eks_cluster.main
  ]
}