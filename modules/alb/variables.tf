variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "environment" {
  type        = string
  description = "Deployment Environment"
}

variable "project" {
  type        = string
  description = "Project Name"
}

variable "subnets" {
  type        = list(string)
  description = "Subnets"
}

variable "app_tg" {
  type        = string
  description = "App target group ARN"
}
