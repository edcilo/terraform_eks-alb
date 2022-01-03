module "dev_cluster" {
  source       = "./cluster"
  cluster_name = "dev-eks"
  region       = "us-east-2"
  aws_profile  = "default"
}
