resource "aws_security_group" "ec2_security_group" {
    name = "regn-sg-${var.SysName_tag}"
    description = "${var.SysName_tag}-Application Security Group"
    vpc_id = "${var.vpc_id}"

#allows all outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

#allows traffic from the SG itself
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        self = true
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = "${var.ssh_source_ip}"
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        self = true
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = "${var.ssh_source_ip}"
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        self = true
    }

}
output "security_group_id" {
  value = "${aws_security_group.ec2_security_group.id}"
}

