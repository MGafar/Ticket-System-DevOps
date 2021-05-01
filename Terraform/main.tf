provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source = "./VPC"

  vpc_cidr = "11.0.0.0/16"

  route = [
    {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = module.vpc.gateway_id
      instance_id    = null
      nat_gateway_id = null
    }
  ]

  subnet_ids = [module.Jenkins.subnet_id, module.RDS.subnet_1_id, module.RDS.subnet_2_id]
}

module "Jenkins" {
  source = "./JenkinsEC2"
  vpc_id = module.vpc.vpc_id
}

module "RDS" {
  source = "./RDS"
  vpc_id = module.vpc.vpc_id
}