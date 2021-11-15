variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "ecs_cluster_arn" {
  type        = string
  description = "ECS cluster ARN"
}
variable "app_name" {
  type        = string
  description = "Application Name"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet IDs to place tasks in"
}

variable "service_desired_replica_count" {
  type        = number
  description = "Number of task replicas to run"
}

variable "app_image" {
  type        = string
  description = "URL of container image to run"
}

variable "app_port" {
  type        = number
  description = "Port to expose"
}
variable "task_memory" {
  type        = number
  description = "Memory to allocate each task"
}

variable "task_cpu" {
  type        = number
  description = "CPU units to allocate each task"
}

variable "execution_role" {
  type        = string
  description = "Execution role for each task"
  default     = null
}
