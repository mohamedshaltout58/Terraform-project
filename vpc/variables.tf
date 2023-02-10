variable "subnet-cidr" {
  type = list 
}
variable "availability-zone" {
  type = list
}
variable "vpc-name" {
  type = string
}
variable "vpc-cidr-block" {
  type = string
}
variable "subnet-name" {
  type = list(string)
}