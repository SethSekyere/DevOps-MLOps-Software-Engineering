# 3-Tier Architecture on AWS Using Terraform

## Overview
This project demonstrates the deployment of a highly available, scalable, and secure 3-tier architecture on AWS using Terraform. The infrastructure is provisioned across three Availability Zones (AZs) to ensure fault tolerance and high availability.

## Architecture
The architecture consists of the following tiers:

1. **Presentation Tier (Web Layer)**
   - Contains a **Bastion Host** for secure SSH access to instances in private subnets.
   - AWS **Application Load Balancer (ALB)** to distribute traffic across web servers.
   - EC2 instances hosting the web application, deployed in public subnets.
   - Security Groups restrict access to only necessary ports (e.g., HTTP, HTTPS).
   - HTTPS-enabled via AWS Certificate Manager (ACM) for secure communication.

2. **Application Tier**
   - Auto Scaling Group (ASG) for EC2 instances running business logic.
   - Hosted within private subnets for security.
   - Security Groups allow only inbound traffic from the Web Layer.
   - IAM roles ensure least privilege access to necessary AWS services.
   - Integration with backend services like Amazon SQS or AWS Lambda if required.

3. **Database Tier**
   - Amazon RDS (Relational Database Service) deployed in a Multi-AZ setup for high availability.
   - Hosted within private subnets to prevent direct internet access.
   - Security Groups allow only inbound traffic from the Application Tier.
   - Automated backups enabled for data durability.

## Features
- **Multi-AZ Deployment**: The architecture is designed across three availability zones for redundancy.
- **Scalability**: Auto Scaling Groups allow dynamic scaling of EC2 instances.
- **Security**: IAM roles, security groups, and private subnets secure the environment.
- **Infrastructure as Code (IaC)**: Terraform automates the deployment process.
- **Modular Terraform Code**: Uses separate modules for networking, compute, and database resources.

## Prerequisites
Before deploying the infrastructure, ensure you have the following:
- AWS CLI configured with appropriate credentials.
- Terraform installed (>= v1.0.0).
- SSH key pair for accessing EC2 instances (if needed).

## Deployment Steps
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourgithubusername/aws-terraform-3tier.git
   cd aws-terraform-3tier
   ```

2. **Initialize Terraform**:
   ```sh
   terraform init
   ```

3. **Plan the Deployment**:
   ```sh
   terraform plan
   ```

4. **Apply the Configuration**:
   ```sh
   terraform apply -auto-approve
   ```

5. **Destroy the Infrastructure (if needed)**:
   ```sh
   terraform destroy -auto-approve
   ```





## Future Enhancements
- Implement CI/CD pipeline for automated deployments.
- Integrate AWS WAF for enhanced security.
- Use AWS Secrets Manager for storing database credentials securely.
- Add CloudWatch monitoring for better observability.


