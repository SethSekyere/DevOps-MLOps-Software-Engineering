resource "aws_key_pair" "afcon2024" {
  key_name   = "afcon2024-key"
  public_key = file("afcon2024-key.pub")
}

 resource "aws_instance" "my_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.afcon2024.key_name
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = var.vpc_security_group_ids
  availability_zone           = var.availability_zone

  tags = {
    Name = "Terraform Instance"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
    

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("afcon2024-key")
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("afcon2024-key")
    }
  }
}
