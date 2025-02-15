#Now creating the instances in the subnets

# Public Instances
#Public Web Instance 1
resource "aws_instance" "web_instance1" {
  ami           = "ami-04681163a08179f28" # Update with a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_web_subnet-1.id
  key_name      = aws_key_pair.Three-tier-Infrastructure.key_name
  associate_public_ip_address = true  # Enable public IP for web instance

  security_groups = [aws_security_group.Public_security_group.id]



  tags = {
    Name = "Web-Instance-1"
  }
}



#Public Web Instance 2

resource "aws_instance" "web_instance2" {
  ami           = "ami-04681163a08179f28" # Update with a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_web_subnet-2.id
  key_name      = aws_key_pair.Three-tier-Infrastructure.key_name
  associate_public_ip_address = true  # Enable public IP for web instance

  security_groups = [aws_security_group.Public_security_group.id]




  tags = {
    Name = "Web-Instance-2"
  }
}




resource "aws_instance" "web_instance3" {
  ami           = "ami-04681163a08179f28" # Update with a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_web_subnet-3.id
  key_name      = aws_key_pair.Three-tier-Infrastructure.key_name
  associate_public_ip_address = true  # Enable public IP for web instance

  # Attach the security group to the instance
  security_groups = [aws_security_group.Public_security_group.id]



  tags = {
    Name = "Web-Instance-3"
  }
}

