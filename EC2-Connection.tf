resource "null_resource" "name" {

  # used to connect the local laptop to the EC2 instance  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = module.Bastion_EC2.public_dns
    private_key = file("terraform_key")
  }

  # File provisioner to push the .pem file to Bastion EC2 instance
  provisioner "file" {
    source = "terraform_key"
    destination = "/tmp/terraform_key"
  }

  # Remote-exec is used to provide executable permission via below command
  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/terraform_key"]
  }

}

