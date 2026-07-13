aws_region = "us-east-1"

cluster_name = "cluster-proyecto-despachos"

cluster_role_arn = "arn:aws:iam::254006190654:role/c216581a5470593l15844854t1w254006-LabEksClusterRole-NWTHkNssZptO"

node_role_arn = "arn:aws:iam::254006190654:role/c216581a5470593l15844854t1w254006190-LabEksNodeRole-fouqEFmOtOn4"

subnet_ids = [
  "subnet-0c2ed56fc5384bbb5", 
  "subnet-03ef58a424f914e0c"  
]

node_instance_type = "t3.medium"

desired_nodes = 2
min_nodes     = 1
max_nodes     = 3