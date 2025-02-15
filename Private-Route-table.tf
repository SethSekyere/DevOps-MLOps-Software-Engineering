# Now let us create private route tables , 

# Create the route table for the private subnet1 
resource "aws_route_table" "private_app_route_table" {
  vpc_id = aws_vpc.three_tier_vpc.id

  
  
  # Route for internet traffic (One-way)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT-gw1.id # Reference to the Internet Gateway
  }


  tags = {
    Name = "Private-app-Route-Table"
  }
}



#############Route table Association 


#Now creating the Route table associations (first for app layer in AZ1)
resource "aws_route_table_association" "AZ1-Private-app-RTA" {
  subnet_id      = aws_subnet.private_app_subnet-1.id
  route_table_id = aws_route_table.private_app_route_table.id

}


#Now creating the Routetable associations for db layer
resource "aws_route_table_association" "AZ1-Private-db-RTA1" {
  subnet_id      = aws_subnet.private_db_subnet-1.id
  route_table_id = aws_route_table.private_app_route_table.id

}










































# Create the route table for the private subnet2 
resource "aws_route_table" "private_app_route_table2" {
  vpc_id = aws_vpc.three_tier_vpc.id

  
  # Route for internet traffic (One-way)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT-gw2.id # Reference to the Internet Gateway
  }


  tags = {
    Name = "Private-app-Route-Table2"
  }
}



#############Route table Association 


#Now creating the Route table associations (first for app layer in AZ2)
resource "aws_route_table_association" "AZ2-Private-app-RTA" {
  subnet_id      = aws_subnet.private_app_subnet-2.id
  route_table_id = aws_route_table.private_app_route_table2.id

}


#Now creating the Routetable associations for db layer
resource "aws_route_table_association" "AZ2-Private-db-RTA2" {
  subnet_id      = aws_subnet.private_db_subnet-2.id
  route_table_id = aws_route_table.private_app_route_table2.id

}


























































# Create the route table for the private subnet3 
resource "aws_route_table" "private_app_route_table3" {
  vpc_id = aws_vpc.three_tier_vpc.id

  # Route for internal VPC communication (default)
  
  # Route for internet traffic (One-way)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT-gw3.id # Reference to the Internet Gateway
  }


  tags = {
    Name = "Private-app-Route-Table3"
  }
}



#############Route table Association 




#Now creating the Route table associations (first for app layer in AZ3)
resource "aws_route_table_association" "AZ3-Private-app-RTA" {
  subnet_id      = aws_subnet.private_app_subnet-3.id
  route_table_id = aws_route_table.private_app_route_table3.id

}


#Now creating the Routetable associations for db layer
resource "aws_route_table_association" "AZ3-Private-db-RTA3" {
  subnet_id      = aws_subnet.private_db_subnet-3.id
  route_table_id = aws_route_table.private_app_route_table3.id

}






















