variable "vpc_id" {
    description = "VPC ID as input for Security Group"
}

variable "adminPc" {
  description = "IP of Admin PC. This is to allow SSH from a single PC"
}
variable "environment" {
  description = "environment of deployment"
}