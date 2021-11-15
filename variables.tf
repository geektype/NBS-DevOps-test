variable "environment" {
  type        = string
  description = "Deployment Environment"
  default     = "DEV"
}

variable "region" {
  type        = string
  description = "Region to provision resources in"
  default     = "eu-west-1"
}

variable "region_simple" {
  type        = string
  description = "Region simplified name"
  default     = "EUWest1"
}

variable "project" {
  type        = string
  description = "Project Name"
  default     = "API"
}


variable "app_name" {
  type        = string
  description = "Application Name"
  default     = "demoAPI"
}

variable "service_desired_replica_count" {
  type        = number
  description = "Number of task replicas to run"
  default     = 2
}

variable "app_image" {
  type        = string
  description = "URL of container image to run"
  default     = "191436313339.dkr.ecr.eu-west-1.amazonaws.com/devops-interview:latest"
}

variable "app_port" {
  type        = number
  description = "Port to expose"
  default     = 80
}
variable "task_memory" {
  type        = number
  description = "Memory to allocate each task"
  default     = 512
}

variable "task_cpu" {
  type        = number
  description = "CPU units to allocate each task"
  default     = 256
}

variable "execution_role" {
  type        = string
  description = "Task Execution Role ARN"
  default     = "arn:aws:iam::191436313339:role/ecsTaskExecutionRole"
}
