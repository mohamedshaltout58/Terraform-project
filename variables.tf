#variables for provider.tf
variable "profile-name" {
  type = string
}
variable "region-name" {
  type = string
}

# #variables for vpc.tf
# variable "vpc-name" {
#   description = "the vpc name you want to create"
#   type = string
# }
# variable "vpc-cidr-block" {
#   type = string
# }

# #variables for subnets.tf
# variable "subnets-cidr-block" {
#     type = list
# }
# variable "subnets-name" {
#   type = list
# }

# #variables for igw.tf
# variable "igw-name" {
#   type = string
# }

# #variables for routetable.tf
# variable "internet-gate" {
#   type = string
# }
# variable "routetable-name" {
#   type = string
# }

# #variables for ElasticIp.tf
# variable "ElasticIp-name" {
#   type = string
# }

# #variables for securitygroup.tf
# variable "securitygroup-name" {
#   type = string
# }
# variable "securitygroup-description" {
#   type = string
# }

# #variables for public-ins.tf
# variable "ami" {
#   type = string
# }
# variable "instance-type" {
#   type = string
# }