This Terraform-based infrastructure-as-code (IaC) project automates the provisioning of an instance configured as a web server. The instance deploys an Apache-based website from a remote source, ensuring seamless and repeatable infrastructure setup.

Dont use code blindly, tweak the variables(variable.tf) to fit what exactly you want. 
Also tweak the web.sh to fit.

DEPLOY!!! (terraform_deploy.sh)

Ensure you run "chmod +x terraform_deploy.sh"




Troubleshooting
Website loads without images?
Verify correct file permissions (chmod -R 755 /var/www/html/).
Check Apache ownership (chown -R apache:apache /var/www/html/).
Restart the Apache service (systemctl restart httpd).


SSH Connection Issues?
Ensure the key pair is correctly referenced.
Validate the security group allows inbound SSH traffic (port 22).


Next Steps
Integrate Terraform state management using S3 for remote backend.
Implement an autoscaling group and load balancer for high availability.
Use Terraform modules for better code modularity.



