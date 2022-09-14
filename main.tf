provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_instance" "example" {
    ami = "ami-063db2954fe2eec9f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

    tags = {
        name = "terraform-example"
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-example-instance"

    ingress {
        from_port   = var.server_port
        to_port     = var.server_port
        protocol    = "tcp"
        cidr_blocks = ["203.246.171.161/32"]
    }
    
}

variable "server_port" {
  type        = number
#  default     = 8080
  description = "The port the server will use for HTTP requests"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  #sensitive   = true
  description = "The public ip address of the web server"
  #depends_on  = []
}
