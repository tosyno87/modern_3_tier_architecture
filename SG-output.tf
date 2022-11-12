# Public Bastion Host Security Group Outputs
#ID of the SG
output "public_bastion_sg_group_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}
# VPC ID
output "public_bastion_sg_group_vpc_id" {
  description = "The VPC ID"
  value       = module.public_bastion_sg.security_group_vpc_id
}
#Group name
output "public_bastion_sg_group_name" {
  description = "The name of the SG"
  value       = module.public_bastion_sg.security_group_name
}

# Private Security Group Outputs
#ID of the SG
output "private_sg_id" {
  description = "The ID of the private security group"
  value       = module.private_security_group.security_group_id
}
# VPC ID
output "private_sg_vpc_id" {
  description = "The VPC ID of the the Private SG "
  value       = module.private_security_group.security_group_vpc_id
}
#Group name
output "private_sg_group_name" {
  description = "The name of the Private SG"
  value       = module.private_security_group.security_group_name
}

#DB SG
output "database_sg_group_id" {
  description = "The name of the Database SG"
  value       = module.security_group.security_group_id
}