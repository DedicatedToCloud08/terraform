variable "vpc_cidr" {
  description = "Cidr for VPC"
}

variable "environment" {
  description = "Environment"
}

variable "subnet_cidr" {
  description = "subnet CIDR"
}

variable "adminPc" {
  description = "IP of Admin PC. This is to allow SSH from a single PC"
}

variable "key_path" {
  description = "Path of keys location"
}

