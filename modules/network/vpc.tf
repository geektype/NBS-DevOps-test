locals {
  vpc_name = "${var.project}-${var.region_simple}-${var.environment}"
}

resource "aws_vpc" "main_vpc" {
  tags = {
    "Name" = local.vpc_name
  }
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "main_vpc_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    "Name" = "${local.vpc_name}-igw"
  }
}

resource "aws_route_table" "main_vpc_rt" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    "Name" = "${local.vpc_name}-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_vpc_igw.id
  }
}
