terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "dev/eks/terraform.tfstate"
    region = "us-west-2"  # Change to your desired region
  }
}