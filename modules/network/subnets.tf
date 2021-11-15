resource "aws_subnet" "ecs_subnet_a" {
  vpc_id                  = aws_vpc.main_vpc.id
  availability_zone       = "${var.region}a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${local.vpc_name}-PUBLIC-a"
  }
}

resource "aws_route_table_association" "subnet_a_rta" {
  subnet_id      = aws_subnet.ecs_subnet_a.id
  route_table_id = aws_route_table.main_vpc_rt.id
}

resource "aws_subnet" "ecs_subnet_b" {
  vpc_id                  = aws_vpc.main_vpc.id
  availability_zone       = "${var.region}b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "${local.vpc_name}-PUBLIC-b"
  }
}

resource "aws_route_table_association" "subnet_b_rta" {
  subnet_id      = aws_subnet.ecs_subnet_b.id
  route_table_id = aws_route_table.main_vpc_rt.id
}
