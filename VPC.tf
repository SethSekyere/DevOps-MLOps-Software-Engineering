provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}




# Create Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "MySubnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Create Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyRouteTable"
  }
}

# Create Route for Internet Access
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "my_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Create Security Group allowing SSH and HTTP from anywhere
resource "aws_security_group" "my_security_group" {
  name        = "my_security_group"
  description = "Allow SSH and HTTP from anywhere"
  vpc_id      = aws_vpc.my_vpc.id  



  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

# Create EC2 Instance with Public IP and Security Group
resource "aws_instance" "my_ec2" {
  ami             = "ami-04b4f1a9cf54c11d0"  # Replace with a valid Ubuntu AMI ID
  instance_type   = "t2.micro"
  key_name        = "Docker"  # SSH key named "Docker"
  subnet_id       = aws_subnet.my_subnet.id
  security_groups = [aws_security_group.my_security_group.id]
  associate_public_ip_address = true  # Assign public IP to EC2 instance
  

  tags = {
    Name = "MyDockerEC2"
  }

  # File provisioner to upload Docker installation script
  provisioner "file" {
    source      = "DockerInstallationScriptforUbuntu.sh"  # Path to your Docker script
    destination = "/tmp/DockerInstallationforUbuntu.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"  # Use "ubuntu" for an Ubuntu AMI
      host        = self.public_ip
      private_key = file("C:/Users/sekye/Downloads/Docker.pem")  # Path to your private key
    }
  }


  # Remote-exec provisioner to execute the Docker installation script
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/DockerInstallationforUbuntu.sh",
      "sudo /tmp/DockerInstallationforUbuntu.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"  # Use "ubuntu" for an Ubuntu AMI
      host        = self.public_ip
      private_key = file("C:/Users/sekye/Downloads/Docker.pem")  # Path to your private key
    }
  }
}
