# Create a DB subnet group


resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.private_db_subnet-1.id, aws_subnet.private_db_subnet-2.id, aws_subnet.private_db_subnet-3.id]

  tags = {
    Name = "db-subnet-group"
  }
}



# Create a security group for the DB instance
resource "aws_security_group" "db_security_group" {
  name        = "db-security-group"
  description = "Allow inbound traffic from PHP app server"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups =[aws_security_group.ssh_from_Bastion_hosts.id]  # Allow traffic from within the VPC
  }









  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-security-group"
  }
}


# Create an RDS MySQL instance with Multi-AZ and read replicas
resource "aws_db_instance" "db_instance" {
  identifier             = "my-db-instance"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.medium"
  allocated_storage      = 20
  storage_type           = "gp2"
  multi_az               = true  # you can enable/disable Multi-AZ deployment. but for high availability enable
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  username               = "admin" #Replace with a good username and if possible create variable files 
  password               = "password"  # Replace with a secure password
  skip_final_snapshot    = true  # Set to false in production to avoid accidental deletion
  publicly_accessible    = false  # Ensure the DB is not publicly accessible
  backup_retention_period = 0  # Enable backups

  tags = {
    Name = "my-db-instance"
  }
}


output "db_endpoint" {
  value = aws_db_instance.db_instance.endpoint
  description = "The endpoint of the RDS MySQL instance"
}
