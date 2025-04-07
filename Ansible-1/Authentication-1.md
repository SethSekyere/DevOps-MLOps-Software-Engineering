
# 🛡️ Setting Up Passwordless SSH Authentication on EC2

This guide walks you through the process of configuring passwordless SSH access to Amazon EC2 instances. You can achieve this using **public key authentication** (recommended) or, for temporary purposes, by enabling password-based authentication.

---

## 🔑 Public Key Authentication (Recommended)

The recommended approach for secure, passwordless login to your EC2 instance is using **public key authentication**. Follow the steps below to set it up:

### 📝 Command

```bash
ssh-copy-id -f "-o IdentityFile <PATH-TO-PEM-FILE>" ubuntu@<INSTANCE-PUBLIC-IP>
```

### 🔍 Breakdown of the Command

- **`ssh-copy-id`**: This command transfers your local public key to the remote server for passwordless login.
- **`-f`**: Forces the overwriting of existing keys on the remote server, which can be helpful if you've already set up keys before.
- **`"-o IdentityFile <PATH-TO-PEM-FILE>"`**: Specifies the private key file that should be used for the SSH connection. This ensures that the correct key is selected during the login attempt.
- **`ubuntu@<INSTANCE-PUBLIC-IP>`**: Replace `ubuntu` with the appropriate user for your instance (e.g., `ec2-user` for Amazon Linux) and `<INSTANCE-PUBLIC-IP>` with the public IP address of your EC2 instance.

---

## 🔑 Password Authentication (Temporary / Testing)

> ⚠️ **Warning**: Using password authentication is not recommended for production environments due to potential security vulnerabilities.

If needed, you can temporarily enable password authentication. Here's how:

### Steps

1. Edit the following configuration file:
   ```bash
   sudo vim /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
   ```

2. Update the configuration to allow password-based login:
   ```
   PasswordAuthentication yes
   ```

3. Restart the SSH service to apply the changes:
   ```bash
   sudo systemctl restart ssh
   ```

---

## 💡 Best Practices

- Always prefer **public key authentication** for enhanced security.
- For automation, consider using tools like **Ansible**, **Terraform**, or **AWS Systems Manager** to manage SSH access across multiple EC2 instances.
- Regularly rotate SSH keys and monitor access logs to maintain security best practices.

---

With these steps, you'll be able to securely manage SSH access to your EC2 instances without relying on passwords. 🚀
```

