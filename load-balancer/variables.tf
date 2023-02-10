variable "vpc-id" {
  type = string
}

#public lb
variable "pub-lb-sg-id" {
  type = string
}

variable "pub-subnets-id" {
  type = list(string)
}

#private lb
variable "priv-lb-sg-id" {
  type = string
}

variable "priv-subnets-id" {
  type = list(string)
}