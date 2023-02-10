resource "tls_private_key" "my-key" {
  algorithm = "RSA"
}
resource "local_file" "my-key-file" {
  content         = tls_private_key.my-key.private_key_pem
  filename        = "my-key.pem"
  file_permission = "0400"
}
resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = tls_private_key.my-key.public_key_openssh
}