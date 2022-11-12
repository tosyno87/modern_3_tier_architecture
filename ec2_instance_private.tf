module "ec2_private" {
  depends_on = [module.vpc] #( VPC will first be created before ec2 instance is created)
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "4.1.4"
  for_each   = toset(["0", "1"])

  name          = "Private EC2 Instance"
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair #"test_key"
  # monitoring             = true
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, tonumber(each.key))
  #instance_count = var.private_instance_count
  user_data = file("${path.module}/app1-install.sh")

  tags = {
    Name = "private-ec2-${each.key}"
    
  }


}