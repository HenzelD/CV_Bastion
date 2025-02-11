#! /bin/bash
sudo yum update -y
sudo yum install -y git
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
cd /var/www/html
sudo git clone https://github.com/HenzelD/CV_Bastion.git
sudo mv /var/www/html/CV_Bastion/EN_CV_Dominik_Henzel.pdf  .
sudo rm -r CV_Bastion 
sudo sed -i 's/DirectoryIndex index.html.*/DirectoryIndex EN_CV_Dominik_Henzel.pdf/' /etc/httpd/conf/httpd.conf
sudo chmod 644 /var/www/html/'EN_CV_Dominik_Henzel.pdf'
sudo chown apache:apache /var/www/html/'EN_CV_Dominik_Henzel.pdf'
sudo service httpd restart