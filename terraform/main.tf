resource "aws_security_group" "strapi_sg" {
  name = "strapi-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "strapi" {
    ami           = "ami-0c1fe732b5494dc14" # Ubuntu ap-south-1
    instance_type = "t3.small"
    key_name      = "strapi-key-jayani"

    vpc_security_group_ids = [aws_security_group.strapi_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "strapi-server"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo yum install docker -y",
            "sudo systemctl start docker",
            "sudo systemctl enable docker",
            "sudo usermod -aG docker ec2-user",
            "sudo docker pull ${var.docker_username}/my-strapi-app:${var.image_tag}",
            "sudo docker stop strapi || true",
            "sudo docker rm strapi || true",
            "sudo docker run -d -p 1337:1337 --name strapi -e HOST=0.0.0.0 -e PORT=1337 -e APP_KEYS=key1,key2,key3,key4 -e API_TOKEN_SALT=apisalt -e ADMIN_JWT_SECRET=adminjwtsecret -e TRANSFER_TOKEN_SALT=transfersalt -e JWT_SECRET=jwtsecret -e ADMIN_AUTH_SECRET=adminauthsecret ${var.docker_username}/my-strapi-app:${var.image_tag}"
        ]

        connection {
            type        = "ssh"
            user        = "ec2-user"
            private_key = file(var.private_key_path)
            host        = self.public_ip
            timeout     = "5m"
        }
    }
}
