output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnets" {
  value = [
    aws_subnet.ecs_subnet_a.id,
    aws_subnet.ecs_subnet_b.id
  ]
}
