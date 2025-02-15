
# Private App Instance 1
resource "aws_instance" "private_app_instance1" {
  ami                        = "ami-04681163a08179f28"  # Update with a valid AMI ID
  instance_type              = "t2.micro"
  subnet_id                  = aws_subnet.private_app_subnet-1.id
  key_name                   = aws_key_pair.Three-tier-Infrastructure.key_name
  associate_public_ip_address = false  # No public IP since it's a private subnet

  # Attach the security group to the instance
  security_groups = [aws_security_group.ssh_from_Bastion_hosts.id]

 
  tags = {
    Name = "Private-App-Instance1"
  }


#Now lets create a Provisioner for the LAMPSTACK INSTALLATION

provisioner "file" {
  source = "Lampstack.sh"
  destination = "/tmp/Lampstack.sh"

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
    private_key = file("Three-tier-Infrastructure-key")
    bastion_host = aws_instance.web_instance1.public_ip
    bastion_user = "ec2-user"
    bastion_private_key = file("Three-tier-Infrastructure-key")
  }
  
}

####################Now lets create a remote-exec provisioner to execute Lampstack script and insert the endpoints of our server
provisioner "remote-exec" {
 inline = [
  "chmod u+x /tmp/Lampstack.sh",
  "sudo /tmp/Lampstack.sh",
  "db_endpoint=$(terraform output -raw db_endpoint)",
  "sudo sed -i 's/localhost/'\"$db_endpoint\"'/g' /var/www/html/config.sample.inc.php",
  "sudo mv /var/www/html/config.sample.inc.php /var/www/html/config.inc.php",
  "sudo systemctl restart httpd"
]

 connection {
      type               = "ssh"
      user               = "ec2-user"
      host               = self.private_ip
      private_key        = file("Three-tier-Infrastructure-key")
      bastion_host       = aws_instance.web_instance1.public_ip
      bastion_user       = "ec2-user"
      bastion_private_key = file("Three-tier-Infrastructure-key")
    }
  }
}


























# Private App Instance 2
resource "aws_instance" "private_app_instance2" {
  ami                        = "ami-04681163a08179f28"  # Update with a valid AMI ID
  instance_type              = "t2.micro"
  subnet_id                  = aws_subnet.private_app_subnet-2.id
  key_name                   = aws_key_pair.Three-tier-Infrastructure.key_name
  associate_public_ip_address = false  # No public IP since it's a private subnet

  # Attach the security group to the instance
  security_groups = [aws_security_group.ssh_from_Bastion_hosts.id]

 
  tags = {
    Name = "Private-App-Instance2"
  }


#Now lets create a Provisioner for the LAMPSTACK INSTALLATION

provisioner "file" {
  source = "Lampstack.sh"
  destination = "/tmp/Lampstack.sh"

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
    private_key = file("Three-tier-Infrastructure-key")
    bastion_host = aws_instance.web_instance2.public_ip
    bastion_user = "ec2-user"
    bastion_private_key = file("Three-tier-Infrastructure-key")
  }
  
}

####################Now lets create a remote-exec provisioner to execute Lampstack script and insert the endpoints of our server
provisioner "remote-exec" {
  inline = [
  "chmod u+x /tmp/Lampstack.sh",
  "sudo /tmp/Lampstack.sh",
  "db_endpoint=$(terraform output -raw db_endpoint)",
  "sudo sed -i 's/localhost/'\"$db_endpoint\"'/g' /var/www/html/config.sample.inc.php",
  "sudo mv /var/www/html/config.sample.inc.php /var/www/html/config.inc.php",
  "sudo systemctl restart httpd"
]
  
 connection {
      type               = "ssh"
      user               = "ec2-user"
      host               = self.private_ip
      private_key        = file("Three-tier-Infrastructure-key")
      bastion_host       = aws_instance.web_instance2.public_ip
      bastion_user       = "ec2-user"
      bastion_private_key = file("Three-tier-Infrastructure-key")
    }
  }
}

































# Private App Instance 3
resource "aws_instance" "private_app_instance3" {
  ami                        = "ami-04681163a08179f28"  # Update with a valid AMI ID
  instance_type              = "t2.micro"
  subnet_id                  = aws_subnet.private_app_subnet-3.id
  key_name                   = aws_key_pair.Three-tier-Infrastructure.key_name
  associate_public_ip_address = false  # No public IP since it's a private subnet

  # Attach the security group to the instance
  security_groups = [aws_security_group.ssh_from_Bastion_hosts.id]

 
  tags = {
    Name = "Private-App-Instance3"
  }


#Now lets create a Provisioner for the LAMPSTACK INSTALLATION

provisioner "file" {
  source = "Lampstack.sh"
  destination = "/tmp/Lampstack.sh"

  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
    private_key = file("Three-tier-Infrastructure-key")
    bastion_host = aws_instance.web_instance1.public_ip
    bastion_user = "ec2-user"
    bastion_private_key = file("Three-tier-Infrastructure-key")
  }
  
}

####################Now lets create a remote-exec provisioner to execute Lampstack script and insert the endpoints of our server
provisioner "remote-exec" {
  inline = [
  "chmod u+x /tmp/Lampstack.sh",
  "sudo /tmp/Lampstack.sh",
  "db_endpoint=$(terraform output -raw db_endpoint)",
  "sudo sed -i 's/localhost/'\"$db_endpoint\"'/g' /var/www/html/config.sample.inc.php",
  "sudo mv /var/www/html/config.sample.inc.php /var/www/html/config.inc.php",
  "sudo systemctl restart httpd"
]
  
 connection {
      type               = "ssh"
      user               = "ec2-user"
      host               = self.private_ip
      private_key        = file("Three-tier-Infrastructure-key")
      bastion_host       = aws_instance.web_instance3.public_ip
      bastion_user       = "ec2-user"
      bastion_private_key = file("Three-tier-Infrastructure-key")
    }
  }
}