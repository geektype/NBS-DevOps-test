output "alb_url" {
  value = aws_alb.app_alb.dns_name
}
