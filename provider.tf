provider "aws" {
  shared_config_files      = ["/home/mohamed/14-terraform/lab1/conf"]
  shared_credentials_files = ["/home/mohamed/14-terraform/lab1/cred"]
  profile                  = var.profile-name
  region                   = var.region-name

}