locals {
  instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
  count = var.environment == "prod" ? 3 : 1
}


data "aws_ami" "ubuntu" {
    most_recent = true
    owners = [ "099720109477" ] # canonical

    filter {
      name = "name"
      values = [ "ubuntu/images/hvm-*" ]
    }

    filter {
      name = "virtualization-type"
      values = [ "hvm" ]
    }

    filter {
      name = "architecture"
      values = [ "x86_64" ]
    }

    filter {
      name = "state"
      values = [ "available" ]
    }

    tags = {
      Name = "${var.environment}-dataSource"
    }
}

resource "aws_key_pair" "mykey" {
  key_name = "${var.environment}-key"
  public_key = file(var.key_path)
}

resource "aws_instance" "ec2_instances" {
  ami = data.aws_ami.ubuntu.id
  instance_type = local.instance_type
  count = local.count
  disable_api_termination = true  
  vpc_security_group_ids = [ var.sg_id ]
  subnet_id = var.subnet_id
  key_name = aws_key_pair.mykey.key_name

    tags = {
      Name = "${var.environment}-${count.index + 1}"
    }
}