#CREATE S3 BUCKET TO STORE STATE 
resource "aws_s3_bucket" "tfstate" {
  bucket        = "webapp-state-files"
}

resource "aws_s3_bucket_acl" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  acl    = "private"
}
