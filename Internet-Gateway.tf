resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "Internet-Gateway"
  }
}




output "internet_gateway_id" {
  description = "ID of the created Internet Gateway"
  value       = aws_internet_gateway.IGW.id
}