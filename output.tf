output "public-lb-dns" {
  value = module.load-balancer.pub-lb-dns
}

output "private-lb-dns" {
  value = module.load-balancer.priv-lb-dns
}