#STORE STATE FILE IN S3 BUCKET
terraform {
  backend "s3" {
    bucket = "webapp-state-files"
    region = "us-east-1"
    key = "eks-cluster/terraform.tfstate"
    shared_credentials_file = "~/.aws/credentials2"
  }
}
