resource "aws_key_pair" "Three-tier-Infrastructure" {
  key_name   = "Three-tier-Infrastructure-key"
  public_key = file("Three-tier-Infrastructure-key.pub")
}






#VPC Creation block
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "three_tier_vpc" {
  cidr_block = "172.20.0.0/20"

  tags = {
    Name = "Three-Tier-VPC"
  }
}





#Public Web subnet creation block
resource "aws_subnet" "public_web_subnet-1" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-Subnet-1"
  }
}

# Public web subnet in AZ2
resource "aws_subnet" "public_web_subnet-2" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Public-Subnet-2"
  }
}

# Public web subnet in AZ3
resource "aws_subnet" "public_web_subnet-3" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Public-Subnet-3"
  }
}























#Private app subnet creation in AZ1
resource "aws_subnet" "private_app_subnet-1" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.4.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-Subnet-1"
  }
}

#Private app subnet creation in AZ2
resource "aws_subnet" "private_app_subnet-2" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.5.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-Subnet-2"
  }
}

#Private app subnet creation in AZ3
resource "aws_subnet" "private_app_subnet-3" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.6.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Private-Subnet-3"
  }
}





#Private DB subnet creation in AZ1
resource "aws_subnet" "private_db_subnet-1" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.7.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private_db_subnet-1"
  }
}



#Private DB subnet creation in AZ2
resource "aws_subnet" "private_db_subnet-2" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.8.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_db_subnet-2"
  }
}

#Private DB subnet creation in AZ3
resource "aws_subnet" "private_db_subnet-3" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "172.20.9.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private_db_subnet-3"
  }
}





