resource "aws_eip" "lab3-eip" {
    count = 2
    tags = {
        Name = var.eip-name[count.index]
    }
}

resource "aws_nat_gateway" "NAT" {
  count = length(var.private-subnets)
  allocation_id = aws_eip.lab3-eip[count.index].id
  subnet_id     = var.private-subnets[count.index]
}

resource "aws_route_table" "private" {
  count = 2
  vpc_id = var.vpc-id
}

resource "aws_route" "private-natgw" {
  count = 2
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NAT[count.index].id
}

resource "aws_route_table_association" "pr-association" {
    count = 2
  subnet_id      = var.private-subnets[count.index]
  route_table_id = aws_route_table.private[count.index].id
}