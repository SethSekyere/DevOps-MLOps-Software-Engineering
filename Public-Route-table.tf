# Now let us create route tables , starting with the Public Web route table


# Create the route table for the public subnet
resource "aws_route_table" "public_web_route_table" {
  vpc_id = aws_vpc.three_tier_vpc.id

  # Route for internal VPC communication (default)
  route {
    cidr_block = "172.20.0.0/20"
    gateway_id = "local"  # Local gateway is implicit for VPC traffic
  }

  # Route for internet traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id # Reference to the Internet Gateway
  }

  tags = {
    Name = "Public-web-Route-Table"
  }
}





#Now lets associate the Route Table for Public Subnets
resource "aws_route_table_association" "public-web-subnet-1-rta" {
  subnet_id      = aws_subnet.public_web_subnet-1.id
  route_table_id = aws_route_table.public_web_route_table.id
}



resource "aws_route_table_association" "public-web-subnet-2-rta" {
  subnet_id      = aws_subnet.public_web_subnet-2.id
  route_table_id = aws_route_table.public_web_route_table.id
}



#Now lets associate the Route Table for Public Subnets
resource "aws_route_table_association" "public-web-subnet-3-rta" {
  subnet_id      = aws_subnet.public_web_subnet-3.id
  route_table_id = aws_route_table.public_web_route_table.id
}
 