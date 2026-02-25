locals {
  region = var.environment == "prod" ? "us-east-2" : "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.environment}-VPC"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = "${local.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}-Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-IGW"
  }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vpc.id

    route {
        gateway_id = aws_internet_gateway.igw.id
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id

}
