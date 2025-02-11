module "Elb_SG" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name = "Elb-SG"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = ["http-80-tcp","https-443-tcp"]
  
  egress_rules = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  tags = var.Elb_tag

}