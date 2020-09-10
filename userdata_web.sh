#!/bin/bash
sudo yum install httpd -y 
sudo systemctl start httpd 
sudo systemctl enable httpd 
sudo yum install wget -y 
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm 
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm 
sudo yum -y install yum-utils 
sudo yum-config-manager --enable remi-php74 -y 
sudo yum update -y 
sudo yum install php php-cli php-mysql mysql -y 
sudo wget https://wordpress.org/latest.tar.gz 
sudo tar xf latest.tar.gz -C /var/www/html 
sudo mv /var/www/html/wordpress/* /var/www/html/ 
sudo chown -R apache:apache /var/www/html/ 
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux 
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config 
sudo systemctl restart httpd 