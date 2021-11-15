resource "aws_ecs_service" "app_service" {
  name            = "${var.app_name}-service"
  cluster         = var.ecs_cluster_arn
  task_definition = aws_ecs_task_definition.app-taskDefinition.arn
  desired_count   = var.service_desired_replica_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.app_tg.arn
    container_name   = "${var.app_name}-container"
    container_port   = var.app_port
  }

  network_configuration {
    subnets = var.subnets

    security_groups  = [aws_security_group.task_sg.id]
    assign_public_ip = true
  }
}
