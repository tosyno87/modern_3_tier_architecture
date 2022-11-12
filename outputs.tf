# VPC Output Values

# VPC ID
output "vpc_id" {
  description = " The ID of the vpc"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of Ids for private subnet"
  value       = module.vpc.private_subnets
}
# VPC Public Subnets
output "public_subnets" {
  description = "List of Ids for public subnet"
  value       = module.vpc.public_subnets
}
# VPC NAT gateway Subnets
output "nat_public_ips" {
  description = "List of public Elastic IPs created for NAT gateway"
  value       = module.vpc.nat_public_ips
}
# VPC AZs
output "azs" {
  description = "List of AZ's"
  value       = module.vpc.azs

}