module "network" {
  source = "../Network"
  vpc_cidr = var.vpc_cidr
  environment = var.environment
  subnet_cidr = var.subnet_cidr
}

module "security" {
  source = "../SecurityGroup"
  vpc_id = module.network.vpc_id
  adminPc = var.adminPc
  environment = var.environment
}

module "compute" {
  source = "../Compute"
  key_path = var.key_path
  sg_id = module.security.sg_id
  subnet_id = module.network.subnet_id
  environment = var.environment
}