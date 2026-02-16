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
    ami           = ""
    instance_type = "t2.micro"
    key_name      = var.key_name

    vpc_security_group_ids = [aws_security_group.strapi_sg.id]

    tags = {
        Name = "strapi-server"
    }

    provisioner "remote-exec" {
        inline = [
        "sudo apt update",
        "sudo apt install docker.io -y",
        "sudo systemctl start docker",
        "sudo docker pull ${var.docker_username}/my-strapi-app:${var.image_tag}",
        "sudo docker stop strapi || true",
        "sudo docker rm strapi || true",
        "sudo docker run -d -p 1337:1337 --name strapi ${var.docker_username}/my-strapi-app:${var.image_tag}"
        ]

        connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host        = self.public_ip
        }
    }
}

