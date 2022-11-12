# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_id
output "ec2_bastion_instance-id" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}
## ec2_bastion_public_ip
output "ec2_bastion_instance-ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = module.ec2_public.public_ip
}


# Private EC2 Instances
## ec2_private_instance_ids
output "ec2_private_instance_id" {
  description = "List of IDs of private instances"
  #value       = module.ec2_private.id
  value = [for ec2private in module.ec2_private : ec2private.id]
}

## ec2_private_ip
output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  #value       = module.ec2_private.ec2_private_ip
  value = [for ec2private in module.ec2_private : ec2private.private_ip]
}