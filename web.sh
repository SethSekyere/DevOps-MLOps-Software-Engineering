#!/bin/bash


yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
unzip -o 2137_barista_cafe.zip
cp 2137_barista_cafe/* /var/www/html/

cp -r 2137_barista_cafe/* /var/www/html/ #I added this to be sure it actually copied recursively
chmod -R 755 /var/www/html/  #ensuring we have all permissions
chown -R apache:apache /var/www/html/ #till here

systemctl restart httpd
