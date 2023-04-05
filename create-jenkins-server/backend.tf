#STORE STATE FILE IN S3 BUCKET
terraform {
  backend "s3" {
    bucket = "webapp-state-files"
    region = "us-east-1"
    key = "jenkins-server/terraform.tfstate"
    shared_credentials_file = "~/.aws/credentials2"
  }
}
