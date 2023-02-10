#public lb
output "pub-lb-arn" {
  value = aws_lb.public-lb.arn
}

output "pub-lb-dns" {
  value = aws_lb.public-lb.dns_name
}

output "pub-lb-tg-arn" {
  value = aws_lb_target_group.pub-lb-tg.arn
}

#private lb
output "priv-lb-arn" {
  value = aws_lb.priv-lb.arn
}

output "priv-lb-dns" {
  value = aws_lb.priv-lb.dns_name
}

output "priv-lb-tg-arn" {
  value = aws_lb_target_group.priv-lb-tg.arn
}