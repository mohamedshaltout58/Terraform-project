resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc-id
}

resource "aws_route_table" "RouteTable" {
  vpc_id = var.vpc-id
  tags = {
    "key" = var.table-name
  }
}
resource "aws_route" "public-route" {
  route_table_id         = aws_route_table.RouteTable.id
  destination_cidr_block = var.internet
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count = length(var.subnet-pub)
  subnet_id      = var.subnet-pub[count.index]
  route_table_id = aws_route_table.RouteTable.id
}
