module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source      = "./modules/security_group"
  vpc_id      = module.vpc.vpc_id
}

module "ami" {
  source        = "./modules/datasource"
}

module "ec2" {
  source                     = "./modules/ec2"
  subnet_id                  = module.vpc.public_subnets[0]
  security_group_id          = module.security_group.id
  ami_id                     = module.ami.ami_id
}
