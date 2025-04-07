# Setting Up Passwordless SSH Authentication on EC2

This README provides instructions for configuring passwordless SSH access to Amazon EC2 instances. You can achieve this either through public key authentication (recommended) or by temporarily enabling password-based authentication.

---

## 🔐 Public Key Authentication (Recommended)

Use the following command to log in to your EC2 instance without a password using a `.pem` private key.

### ✅ Command

```bash
ssh-copy-id -f "-o IdentityFile <PATH TO PEM FILE>" ubuntu@<INSTANCE-PUBLIC-IP>
```

### 💡 Explanation

- `ssh-copy-id`: Copies your public key to a remote server.
- `-f`: Forces the copying of keys. This is useful if keys are already set up and you want to overwrite them.
- `"-o IdentityFile <PATH TO PEM FILE>`": Specifies the private key to use for the connection. The `-o` flag passes this option to the underlying SSH command.
- `ubuntu@<INSTANCE-PUBLIC-IP>`: Replace this with the appropriate username (e.g., `ubuntu`) and the IP address of the remote server.

---

## 🔑 Password Authentication (Optional / For Testing)

> ⚠️ Not recommended for production environments due to security concerns.

### Steps

1. Open the following file:
   ```bash
   /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
   ```

2. Modify the configuration:
   ```
   PasswordAuthentication yes
   ```

3. Restart the SSH service:
   ```bash
   sudo systemctl restart ssh
   ```

---

## ✅ Best Practices

- Always use key-based authentication for improved security.
- Tools like **Ansible**, **Terraform**, and **AWS Systems Manager** can be used to automate access configuration.
- Periodically rotate SSH keys and review access logs to ensure security compliance.

---


