
# 🔧 Ansible Inventory Guide

This document explains how Ansible uses **inventory files** to identify and group remote machines for automation tasks. These files tell Ansible *what* to manage and *where* to find it. Inventories can be written manually (static) or generated dynamically from sources like cloud platforms.

---

## 📄 Static Inventory

Static inventories are manually maintained files listing servers and groups. They can be written in **INI** or **YAML** format and typically go by the name `inventory` or `hosts`.

### 📝 INI Format Example

```ini
# File: hosts

[webservers]
web1.example.com
web2.example.com

[dbservers]
db1.example.com
db2.example.com

[all:vars]
ansible_user=admin
ansible_ssh_private_key_file=/path/to/private_key.pem
```

### 🧾 YAML Format Example

```yaml
# File: hosts.yaml

all:
  vars:
    ansible_user: admin
    ansible_ssh_private_key_file: /path/to/private_key.pem
  children:
    webservers:
      hosts:
        web1.example.com:
        web2.example.com:
    dbservers:
      hosts:
        db1.example.com:
        db2.example.com:
```

---

## 🔄 Dynamic Inventory

In dynamic environments like AWS or GCP, the number of servers and their IPs can change frequently. A **dynamic inventory** lets Ansible pull this data in real-time using custom scripts or built-in plugins.

Here’s a basic example using Python and Boto3 to retrieve live EC2 instances.

### 🐍 AWS EC2 Inventory Script

```python
#!/usr/bin/env python

import json
import boto3

def fetch_inventory():
    ec2 = boto3.client('ec2')
    response = ec2.describe_instances()
    
    inventory = {
        'all': {
            'hosts': [],
            'vars': {
                'ansible_user': 'ec2-user',
                'ansible_ssh_private_key_file': '/path/to/private_key.pem'
            }
        },
        '_meta': {
            'hostvars': {}
        }
    }

    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            if instance['State']['Name'] == 'running':
                ip = instance.get('PublicIpAddress')
                if ip:
                    inventory['all']['hosts'].append(ip)
                    inventory['_meta']['hostvars'][ip] = {
                        'ansible_host': ip
                    }

    print(json.dumps(inventory, indent=2))

if __name__ == '__main__':
    fetch_inventory()
```

Make sure to install `boto3` and configure your AWS credentials for this to work.

---

## 🚀 Running Playbooks with Inventories

### Using a Static Inventory

```bash
ansible-playbook -i inventory playbook.yml
```

You can also run ad-hoc commands like:

```bash
ansible -i inventory all -m ping
```

### Using a Dynamic Inventory Script

Ensure the script is executable:

```bash
chmod +x dynamic_inventory_script.py
```

Then run your playbook like this:

```bash
ansible-playbook -i ./dynamic_inventory_script.py playbook.yml
```

---
