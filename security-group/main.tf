
resource "aws_security_group" "pub-lb-sg" {
  vpc_id = var.vpc-id
  ingress {
    description      = "My Ingress Rules"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "public-LB"
  }
}
resource "aws_security_group" "priv-lb-sg" {
  vpc_id = var.vpc-id
  ingress {
    description     = "My Ingress Rules"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.pub-ec2s-sg.id]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "private-LB"
  }
}
resource "aws_security_group" "pub-ec2s-sg" {
  vpc_id = var.vpc-id
  ingress {
    description = "My SSH Ingress Rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description     = "My HTTP Ingress Rule"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.pub-lb-sg.id]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "pub-ec2s-sg"
  }
}
resource "aws_security_group" "priv-ec2s-sg" {
  vpc_id = var.vpc-id
  ingress {
    description     = "My HTTP Ingress Rule"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.priv-lb-sg.id]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "priv-ecs2-sg"
  }
}