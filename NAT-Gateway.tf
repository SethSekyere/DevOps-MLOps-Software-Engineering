##Now lets create NAT GATEWAYS
##For the first availability zone,


resource "aws_nat_gateway" "NAT-gw1" {
  allocation_id = aws_eip.nat-gw1-eip.id #Remember to create an Elastic IP
  subnet_id     = aws_subnet.public_web_subnet-1.id

  tags = {
    Name = "NAT gw1"
  }
  depends_on = [ aws_internet_gateway.IGW ]
}

# Elastic IP for NAT Gateway 1
resource "aws_eip" "nat-gw1-eip" {
  domain = "vpc"
}









# NAT Gateway for the second availability zone
resource "aws_nat_gateway" "NAT-gw2" {
  allocation_id = aws_eip.nat-gw2-eip.id #Remember to create an Elastic IP
  subnet_id     = aws_subnet.public_web_subnet-2.id

  tags = {
    Name = "NAT gw2"
  }
  depends_on = [ aws_internet_gateway.IGW ]
}

# Elastic IP for NAT Gateway 2
resource "aws_eip" "nat-gw2-eip" {
  domain = "vpc"
}











# NAT Gateway for the third availability zone
resource "aws_nat_gateway" "NAT-gw3" {
  allocation_id = aws_eip.nat-gw3-eip.id #Remember to create an Elastic IP
  subnet_id     = aws_subnet.public_web_subnet-3.id

  tags = {
    Name = "NAT gw3"
  }
  depends_on = [ aws_internet_gateway.IGW ]
}

# Elastic IP for NAT Gateway 3
resource "aws_eip" "nat-gw3-eip" {
  domain = "vpc"
}




