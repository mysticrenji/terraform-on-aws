module "compute" {
  source           = "./modules/compute"
  public_sg        = module.networking.public_sg
  public_subnets   = module.networking.public_subnets
  instance_count   = 1
  instance_type    = "t3.micro"
  vol_size         = "20"
  public_key_path  = "/home/codespace/.ssh/id_rsa.pub"
  key_name         = "mtckey"
  user_data_path   = "${path.root}/userdata.tpl"
  tg_port          = 8000
  private_key_path = "/home/codespace/.ssh/id_rsa"
}

module "networking" {
  source          = "./modules/networking"
  vpc_cidr        = local.vpc_cidr
  public_sn_count = 1
  public_cidrs    = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  max_subnets     = 20
  access_ip       = var.access_ip
  security_groups = local.security_groups
}