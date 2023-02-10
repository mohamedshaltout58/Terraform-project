output "public-ec2-id-1" {
  value = aws_instance.pub-ec2[0].public_ip
}

output "public-ec2-id-2" {
  value = aws_instance.pub-ec2[1].public_ip
}

output "private-ec2-id-1" {
  value = aws_instance.priv-ec2[0].private_ip
}

output "private-ec2-id-2" {
  value = aws_instance.priv-ec2[1].private_ip
}