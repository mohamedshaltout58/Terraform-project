resource "aws_s3_bucket" "terraform-bucket" {
  bucket = var.bucket-name
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "enable-versioning" {
  bucket = aws_s3_bucket.terraform-bucket.id
  versioning_configuration {
    status = var.status-bucket
  }
}