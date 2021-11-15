resource "aws_ecs_cluster" "app_cluster" {
  name = "${var.project}-${var.environment}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
