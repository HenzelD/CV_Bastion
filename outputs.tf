output "elb_dns_name" {
  value       = module.alb.lb_dns_name
}

output "CV_IP1" {
  value       = module.Private_EC2[0].private_ip
}

output "CV_IP2" {
  value       = module.Private_EC2[1].private_ip
}

output "EN_CV_IP1" {
  value       = module.Private_EC2_2[0].private_ip
}

output "EN_CV_IP2" {
  value       = module.Private_EC2_2[1].private_ip
}

output "Bastion_IP" {
  value       = module.Bastion_EC2.public_ip
}