# Define the security group for public subnet
resource "aws_security_group" "sgweb" {
  name = "pacbot_server_security_group"
  description = "Allow incoming HTTP connections & SSH access"

 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["14.98.18.98/32"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks =  ["14.98.18.98/32"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  vpc_id="${var.VPCID}"

  tags = {
    Name = "Pacbot Server SG"
  }
}

