variable "vpc_cidr" {
  description = "Cidr for VPC"
}

variable "environment" {
  description = "Environment"
}

variable "subnet_cidr" {
  description = "subnet CIDR"
}

variable "availibilty_zone_lastletter" {
  description = "The availibility zone to deploy subnet in just the last letter"
}