output "public_ip" {
  description = "Public Ips for ec2 instances"
  value = aws_instance.ec2_instances[*].public_ip # Splat expression usage
}