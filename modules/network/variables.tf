variable "environment" {
  type        = string
  description = "Deployment Environment"
}

variable "region" {
  type        = string
  description = "Region to provision resources in"
}

variable "region_simple" {
  type        = string
  description = "Region simplified name"
}

variable "project" {
  type        = string
  description = "Project Name"
}
