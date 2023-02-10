output "pub-lb-sg-id" {
  value = aws_security_group.pub-lb-sg.id
}

output "priv-lb-sg-id" {
  value = aws_security_group.priv-lb-sg.id
}

output "pub-ec2s-sg-id" {
  value = aws_security_group.pub-ec2s-sg.id
}

output "priv-ec2s-sg-id" {
  value = aws_security_group.priv-ec2s-sg.id
}
