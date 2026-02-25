output "public_ip" {
  description = "Public Ips for ec2 instances"
  value = module.compute.public_ip # Splat expression usage
}