module "app" {
  source = "git::https://github.com/DedicatedToCloud08/terraform.git//Terraform_Modules/CompositeApp?ref=v1.0.1"
  vpc_cidr = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  adminPc = var.adminPc
  key_path = var.key_path
  environment = var.environment
}