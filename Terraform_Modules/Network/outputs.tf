output "vpc_id" {
  description = "Output of VPC ID"
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  description = "Output of Subnet ID"
  value = aws_subnet.subnet.id
}