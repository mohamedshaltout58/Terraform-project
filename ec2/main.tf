#public EC2
resource "aws_instance" "pub-ec2" {
  count                       = length(var.public-subnets-id)
  ami                         = var.ami-id
  instance_type               = "t2.micro"
  subnet_id                   = var.public-subnets-id[count.index]
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.pub-ec2-sg-id]
  key_name                    = var.key-name
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y ",
      "echo 'server {\nlisten 80 default_server;\nlisten [::]:80 default_server;\nserver_name _;\nlocation / {\nproxy_pass http://${var.private-lb-dns};\n}\n}' > default",
      "sudo mv default /etc/nginx/sites-enabled/default",
      "sudo systemctl restart nginx"
    ]
  }
  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("my-key.pem")
  }
  provisioner "local-exec" {
    command = "echo Public-IP: ${self.public_ip} >> IPs.txt"
  }
  tags = {
    "Name" = var.pub-ec2-name[count.index]
  }
}

resource "aws_lb_target_group_attachment" "public-lb-tg-attachment" {
  count            = length(var.public-subnets-id)
  target_group_arn = var.public-lb-tg-arn
  target_id        = aws_instance.pub-ec2[count.index].id
  port             = 80
}

#private EC2
resource "aws_instance" "priv-ec2" {
  count                       = length(var.priv-subnets-id)
  ami                         = var.ami-id
  instance_type               = "t2.micro"
  subnet_id                   = var.priv-subnets-id[count.index]
  associate_public_ip_address = false
  vpc_security_group_ids      = [var.priv-ec2-sg-id]
  key_name                    = var.key-name
  user_data                   = file("user-data.sh")
  tags = {
    "Name" = var.priv-ec2-name[count.index]
  }
  provisioner "local-exec" {
    command = "echo Private_IP: ${self.private_ip} >> IPs.txt"
  }
}

resource "aws_lb_target_group_attachment" "private-lb-tg-attachment" {
  count            = length(var.priv-subnets-id)
  target_group_arn = var.private-lb-tg-arn
  target_id        = aws_instance.priv-ec2[count.index].id
  port             = 80
}