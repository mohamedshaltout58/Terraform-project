output "vpc-id" {
  value = aws_vpc.vpc.id
}
output "subnet-1" {
  value = aws_subnet.subnet[0].id
}
output "subnet-2" {
  value = aws_subnet.subnet[1].id
}
output "subnet-3" {
  value = aws_subnet.subnet[2].id
}
output "subnet-4" {
  value = aws_subnet.subnet[3].id
}