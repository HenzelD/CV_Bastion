module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.6.0"

  name = var.Elb_name

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups    = [module.Elb_SG.security_group_id]

  # Listener na porcie 80 dla CV
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0  
    },
    {
      port               = 81
      protocol           = "HTTP"
      target_group_index = 1  
    }
  ]

  target_groups = [
    {
      name             = "CV"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }

      targets = {
        app1_vm1 = { target_id = module.Private_EC2[0].id, port = 80 }
        app1_vm2 = { target_id = module.Private_EC2[1].id, port = 80 }
      }
    },
    {
      name             = "ENCV"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"

      health_check = {
        enabled             = true
        interval            = 30
        path                = "/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }

      targets = {
        app2_vm1 = { target_id = module.Private_EC2_2[0].id, port = 80 }
        app2_vm2 = { target_id = module.Private_EC2_2[1].id, port = 80 }
      }
    }
  ]

}