variable "ami-id" {
  type = string
}

variable "key-name" {
  type = string
}

#public 
variable "public-subnets-id" {
  type = list(string)
}

variable "pub-ec2-sg-id" {
  type = string
}

variable "pub-ec2-name" {
  type = list(string)
}

variable "public-lb-tg-arn" {
  type = string
}

#private
variable "priv-subnets-id" {
  type = list(string)
}

variable "priv-ec2-sg-id" {
  type = string
}

variable "priv-ec2-name" {
  type = list(string)
}

variable "private-lb-tg-arn" {
  type = string
}

variable "private-lb-dns" {
  type = string
}