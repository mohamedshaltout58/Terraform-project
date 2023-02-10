resource "aws_vpc" "vpc" {
  cidr_block = var.vpc-cidr-block

  tags = {
    "Name" = var.vpc-name
  }
}

resource "aws_subnet" "subnet" {
  count = length(var.subnet-cidr)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet-cidr[count.index]
  availability_zone = var.availability-zone[count.index]
  tags = {
    "Name" = var.subnet-name[count.index]
  }
}