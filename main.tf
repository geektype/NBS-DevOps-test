terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.65.0"
    }
  }

  backend "s3" {
    bucket = "devops-interviews-terraform"
    key    = "devOps-interview-tf-state"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
  # ONLY HERE FOR DEVELOPMENT EASE
  # DO NOT USE FOR REAL DEPLOYMENTS.Use Env vars or the aws configure utility
  secret_key = "XXXXXXXXXXXXXXXXX"
  access_key = "XXXXXXXXXXXXXXXXX"


  default_tags {
    tags = {
      Project     = var.project
      Environmnet = var.environment
    }
  }
}

module "network" {
  source = "./modules/network"

  environment   = var.environment
  region        = var.region
  region_simple = var.region_simple
  project       = var.project
}

module "ecs_cluster" {
  source = "./modules/ecs_cluster"

  environment = var.environment
  project     = var.project
  vpc_id      = module.network.vpc_id
}



module "app" {
  source = "./modules/app"

  vpc_id                        = module.network.vpc_id
  project                       = var.project
  environment                   = var.environment
  ecs_cluster_arn               = module.ecs_cluster.ecs_cluster_arn
  app_name                      = var.app_name
  subnets                       = module.network.subnets
  service_desired_replica_count = var.service_desired_replica_count
  app_image                     = var.app_image
  app_port                      = var.app_port
  task_memory                   = var.task_memory
  task_cpu                      = var.task_cpu
  execution_role                = var.execution_role
}

module "alb" {
  source = "./modules/alb"

  vpc_id      = module.network.vpc_id
  environment = var.environment
  project     = var.project
  subnets     = module.network.subnets
  app_tg      = module.app.app_tg
}
