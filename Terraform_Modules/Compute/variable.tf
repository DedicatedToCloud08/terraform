variable "environment" {
  description = "Environment of Deployment"

  validation {
    condition = contains(["dev","prod"], var.environment)
    error_message = "Please enter prod or dev no blank spaces or other keywords!"
  }
}

variable "key_path" {
  description = "Path of keys location"
}

variable "sg_id" {
  description = "Security Group for SSHable Instance"
}

variable "subnet_id" {
  description = "Subnet of sshable instance placement"
}

