# Description
The CV_Bastion project automates infrastructure configuration in AWS using Terraform. It creates a bastion host with internet access, acting as an intermediary that enables secure connections to private instances within the VPC. Additionally, it sets up two private subnets, each hosting two virtual machines – one CV instance and one EN_CV instance. The Load Balancer directs traffic so that the CV page in Polish is available on port 80, while the CV page in English is accessible on port 81.

## Requirements:
- AWS account 
- Terraform
## Installation:
```bash
aws configure
git clone https://github.com/HenzelD/CV_Bastion.git
cd CV_Bastion
```
## Structure
- Bastion host – a publicly accessible machine for managing the environment
- Two private subnets – each containing one CV instance and one EN_CV instance
- Load Balancer – routes traffic to instances in the private subnets
## Usage
Run the following command in the terminal:
```bash
terraform init
terraform apply 
```
Enter the dns name from output console.






