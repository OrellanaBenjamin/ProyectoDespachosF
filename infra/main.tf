resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = "arn:aws:iam::889217351448:role/c205808a5245981l14384715t1w889217-LabEksClusterRole-it4O1krN8bIT"

  vpc_config {
    subnet_ids = [
      "subnet-0e7a9ff17d547bde9",
      "subnet-0542d6e2f78331437"
    ]
  }
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "workers"

  node_role_arn = "arn:aws:iam::889217351448:role/c205808a5245981l14384715t1w889217351-LabEksNodeRole-zR5Q0X9Y9hXO"

  subnet_ids = [
    "subnet-0e7a9ff17d547bde9",
    "subnet-0542d6e2f78331437"
  ]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  instance_types = ["t3.medium"]

  depends_on = [
    aws_eks_cluster.main
  ]
}