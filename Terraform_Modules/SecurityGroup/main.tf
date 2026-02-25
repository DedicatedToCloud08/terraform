resource "aws_security_group" "sg_ssh" {
  vpc_id = var.vpc_id
  description = "Allow SSH connection SG"
  name = "SSH ALLOW From ADMIN PC"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = [ var.adminPc ]
    description = "SSH ALLOW From ADMIN PC"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Egress to internet for Package downloads etc"
  }

      tags = {
    Name = "${var.environment}-SG-ALLOW-SSH"
  }
}