variable "aws_region" {
  description = "Región de AWS donde se desplegará la infraestructura"
  type        = string

  validation {
    condition     = can(regex("^us-", var.aws_region))
    error_message = "La región AWS debe comenzar con us-."
  }
}

variable "cluster_name" {
  description = "Nombre del cluster Amazon EKS"
  type        = string

  validation {
    condition     = length(var.cluster_name) > 3
    error_message = "El nombre del cluster debe tener más de 3 caracteres."
  }
}

variable "cluster_role_arn" {
  description = "ARN del rol IAM asociado al cluster EKS"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:iam::", var.cluster_role_arn))
    error_message = "El ARN del rol del cluster no es válido."
  }
}

variable "node_role_arn" {
  description = "ARN del rol IAM asociado a los nodos EKS"
  type        = string

  validation {
    condition     = can(regex("^arn:aws:iam::", var.node_role_arn))
    error_message = "El ARN del rol del nodo no es válido."
  }
}

variable "subnet_ids" {
  description = "Lista de subredes utilizadas por el cluster EKS"
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "Debe especificar al menos dos subredes."
  }
}

variable "node_instance_type" {
  description = "Tipo de instancia EC2 utilizada por los worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_nodes" {
  description = "Cantidad deseada de nodos worker"
  type        = number
  default     = 2

  validation {
    condition     = var.desired_nodes >= 1
    error_message = "Debe existir al menos un nodo."
  }
}

variable "min_nodes" {
  description = "Cantidad mínima de nodos worker"
  type        = number
  default     = 1

  validation {
    condition     = var.min_nodes >= 1
    error_message = "El mínimo de nodos debe ser al menos 1."
  }
}

variable "max_nodes" {
  description = "Cantidad máxima de nodos worker"
  type        = number
  default     = 3

  validation {
    condition     = var.max_nodes >= var.min_nodes
    error_message = "El máximo de nodos debe ser mayor o igual al mínimo."
  }
}