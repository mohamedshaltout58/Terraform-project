#public load balancer configurations
resource "aws_lb" "public-lb" {
  name               = "public-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.pub-lb-sg-id]
  subnets            = [for subnet in var.pub-subnets-id : subnet]
}
resource "aws_lb_target_group" "pub-lb-tg" {
  name     = "pub-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}
resource "aws_lb_listener" "pub-lb-listener" {
  load_balancer_arn = aws_lb.public-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pub-lb-tg.arn
  }
}

#Private load balancer configurations

resource "aws_lb" "priv-lb" {
  name               = "private-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.priv-lb-sg-id]
  subnets            = [for subnet in var.priv-subnets-id : subnet]
}
resource "aws_lb_target_group" "priv-lb-tg" {
  name     = "priv-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}
resource "aws_lb_listener" "priv-lb-listener" {
  load_balancer_arn = aws_lb.priv-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.priv-lb-tg.arn
  }
}
