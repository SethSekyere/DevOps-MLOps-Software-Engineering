#!/bin/bash
# Initialize Terraform
terraform init
# Plan the deployment
terraform plan
# Apply the changes automatically
terraform apply -auto-approve
