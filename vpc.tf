module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "my-vpc2"
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  create_database_subnet_group       = var.vpc_database_subnet_group
  create_database_subnet_route_table = var.vpc_subnet_route_table
  database_subnets                   = var.vpc_database_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Name = "public-subnets"
  }
  private_subnet_tags = {
    Name = "private-subnets"
  }

  database_subnet_tags = {
    Name = "database-subnets"
  }
  tags = {
    Owner       = "Obatos"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }




}
