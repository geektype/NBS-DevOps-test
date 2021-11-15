resource "aws_ecs_task_definition" "app-taskDefinition" {
  family                   = "${var.app_name}-taskDefinition"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.execution_role
  container_definitions = jsonencode([
    {
      name      = "${var.app_name}-container"
      image     = var.app_image
      memory    = var.task_memory
      essential = true

      portMappings = [{
        containerPort = var.app_port
        protocol      = "tcp"
      }]

    }
  ])
}
