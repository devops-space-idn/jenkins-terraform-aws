module "networking" {
  source = "../../modules/networking"
}

module "jenkins" {
  source = "../../modules/jenkins"

  vpc_id = module.networking.vpc_id
  subnet_id = module.networking.public_subnet_id
  ssh_public_key = var.ssh_public_key
}