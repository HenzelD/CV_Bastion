module "Private_EC2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name = var.EC2-Private_name
  ami = data.aws_ami.ec2linux.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  
  for_each = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.value))
  vpc_security_group_ids = [module.Private_SG.security_group_id]

  user_data = file("CV.sh")
  
  tags = var.Private_tag
}