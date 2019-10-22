# Define the security group for public subnet
resource "aws_security_group" "sgweb" {
  name = "jenkins_server_security_group"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["10.0.0.0/8"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks =  ["10.0.0.0/8"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["172.16.0.0/12"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["172.16.0.0/12"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["172.16.0.0/12"]
  }

 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["172.16.0.0/12"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks =  ["172.16.0.0/12"]
    
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks =  ["14.98.18.98/12"]

  vpc_id="${var.VPCID}"

  tags = {
    Name = "Jenkins Server SG"
  }
}

