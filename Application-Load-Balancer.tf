# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "ALB-SG"
  description = "Security group for the Application Load Balancer"
  vpc_id      = aws_vpc.three_tier_vpc.id

  # Allow HTTP and HTTPS traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB-Security-Group"
  }
}

# Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name               = "my-application-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
   subnets            = [aws_subnet.public_web_subnet-1.id, aws_subnet.public_web_subnet-2.id,aws_subnet.public_web_subnet-3.id]  # Replace with your public subnet IDs

  enable_deletion_protection = false

  tags = {
    Name = "Application-Load-Balancer"
  }
}



# Target Group for ALB
resource "aws_lb_target_group" "app_target_group" {
  name        = "app-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.three_tier_vpc.id
  target_type = "instance"

  health_check {
    path                = "/" #health check path
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    port                = "traffic-port"
    matcher = "200" # HTTP 200 indicates a healthy instance
  }

  tags = {
    Name = "Web-Target-Group"
  }
}



# Attach PHP app Instances to Target Group
resource "aws_lb_target_group_attachment" "private_app1_attachment" {
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = aws_instance.private_app_instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "private_app2_attachment" {
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = aws_instance.private_app_instance2.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "private_app3_attachment" {
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = aws_instance.private_app_instance3.id
  port             = 80
}

# ALB Listener to Forward Traffic
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}
