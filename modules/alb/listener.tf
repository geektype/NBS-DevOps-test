resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = aws_alb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "ok"
      status_code  = "200"
    }
  }

}

resource "aws_alb_listener_rule" "app_http_rule" {
  listener_arn = aws_alb_listener.http_listener.arn
  priority     = 1

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
  action {
    type             = "forward"
    target_group_arn = var.app_tg
  }

}
