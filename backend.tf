resource "aws_dynamodb_table" "terraform-locks" {
  name         = "terraform-locks-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-bucket-for-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-table"
    encrypt        = true
  }
}