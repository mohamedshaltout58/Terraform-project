output "eip1" {
  value = aws_eip.lab3-eip[0].id
}
output "eip2" {
  value = aws_eip.lab3-eip[1].id
}
output "eip-add-1" {
  value = aws_eip.lab3-eip[0].address
}
output "eip-add-2" {
  value = aws_eip.lab3-eip[1].address
}
output "private_route_table_id-1" {
  value = aws_route_table.private[0].id
}
output "private_route_table_id-2" {
  value = aws_route_table.private[1].id
}

output "NAT-1" {
  value = aws_nat_gateway.NAT[0].id
}
output "NAT-2" {
  value = aws_nat_gateway.NAT[1].id
}