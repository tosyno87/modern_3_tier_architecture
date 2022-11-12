module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.2.0"
  name    = "my-alb"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups = [module.loadbalancer_sg.security_group_id]
  #listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
# target group
  target_groups = [
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      # APP1 target group
      targets = {
        my_app1_vm1 = {
          target_id = [for ec2private in module.ec2_private : ec2private.id][0]
          port      = 80
        }
        my_app1_vm2 = {
          target_id =[for ec2private in module.ec2_private : ec2private.id][1]
          port      = 80
        }
      }
      tags = {
        Name = "my_tags"
      }
    }
  ]

  tags = {
    Name = "Test"
  }


}