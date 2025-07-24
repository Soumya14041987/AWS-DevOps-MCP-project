provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

module "eks" {
  source = "../../modules/eks"

  cluster_name    = "dev-eks-cluster"
  cluster_version = "1.27"
  vpc_id         = "vpc-xxxxxx"  # Replace with your VPC ID
  subnet_ids     = ["subnet-xxxxxx", "subnet-yyyyyy"]  # Replace with your subnet IDs

  min_size     = 1
  max_size     = 3
  desired_size = 2

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}