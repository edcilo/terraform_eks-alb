variable "cluster_name" {
  default     = "eks-cluster"
  description = "EKS Cluster name"
}

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "instance_type" {
  default     = "t2.small"
  description = "EC2 instance type"
}

variable "cluster_version" {
  default     = "1.21"
  description = "K8S version"
}

variable "module_path" {
  default = "./cluster"
  description = "The path of the current module"
}
