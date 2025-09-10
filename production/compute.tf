module "prod_compute_1" {
  source      = "../modules/compute"
  environment = module.prod_vpc_1.environment
  amis = {
    us-east-1 = "ami-0360c520857e3138f" # ubuntu 24.04 LTS
    us-east-2 = "ami-0cfde0ea8edd312d4" # ubuntu 24.04 LTS
  }
  aws_region      = var.aws_region
  instance_type   = "t2.nano"
  key_name        = "Latest"
  public_subnets  = module.prod_vpc_1.public_subnets_id
  private_subnets = module.prod_vpc_1.private_subnets_id
  sg_id           = module.prod_sg_1.sg_id
  vpc_name        = module.prod_vpc_1.vpc_name
  natgw_id = module.prod_natgw_1.natgw_id
}
