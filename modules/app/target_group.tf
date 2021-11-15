resource "aws_alb_target_group" "app_tg" {
  name        = "appTG"
  port        = var.app_port
  target_type = "ip"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
}
