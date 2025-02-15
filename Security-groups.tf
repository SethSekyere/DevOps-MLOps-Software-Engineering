# Security group for Bastion Hosts
resource "aws_security_group" "Public_security_group" {
  name        = "my_Public_sg"
  description = "Security group allowing HTTP from anywhere and SSH"
  vpc_id      = aws_vpc.three_tier_vpc.id # Reference the correct VPC here

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows HTTP from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}







# Security group for Private App Instances
resource "aws_security_group" "ssh_from_Bastion_hosts" {
  name        = "Private security group"
  description = "Security group allowing SSH only from Bastion Host"
  vpc_id      = aws_vpc.three_tier_vpc.id # Reference the correct VPC here

  # Allow SSH (Port 22) from the Public_security_group
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.Public_security_group.id] # Reference the Bastion Host's security group
  }

  # Allow HTTP (Port 80) from the Application Load Balancer's security group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id] # Reference the ALB's security group
  }


  #Allowing Http traffic from everywhere
    ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    }

  # Egress rule (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


