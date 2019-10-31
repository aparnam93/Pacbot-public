terraform {
  backend "s3" {
    bucket = "regn-tf-state-tst"
    key = "us-east-1/pacbot/packbot_jenkins.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}
resource "aws_instance" "server" {
   ami = "${var.linux_base_ami}"
   instance_type = "${var.instance_type}"
   key_name = "pacbot-application"
   subnet_id = "${var.vpc_subnet_id}"
   vpc_security_group_ids = ["${aws_security_group.ec2_security_group.id}"]
   iam_instance_profile = "${aws_iam_instance_profile.pacbot_instance_profile.name}"
   user_data = "${file("userdata.sh")}"
   tags {
    Name = "${var.hostname_tag}"
    BusinessUnit = "${var.BusinessUnit}"
    CostCenter = "${var.CostCenter}"
    Environment = "${var.Environment}"
    SysOwner = "${var.SysOwner}"
    SysName  = "${var.SysName}"
    Department = "${var.Department}"
    TSM = "${var.tsm}"
    Scheduler = "${var.Scheduler}"
    "/Patch Group/" = "${var.PatchGroup}"
  }
}

resource "aws_iam_role" "pacbot_server_role" {
  name = "pacbot_server_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "pacbot_instance_profile" {
  name = "pacbot_instance_profile"
  role = "${aws_iam_role.pacbot_server_role.name}"
}
resource "aws_iam_role_policy" "pacbot_server_policy" {
  name = "pacbot_server_policy"
  role = "${aws_iam_role.pacbot_server_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
		  "rds:*",
		  "s3:*",
		  "redshift:*",
		  "logs:*",
		  "elasticloadbalancing:*",
		  "iam:*",
		  "es:*",
		  "batch:*",
		  "cloudwatch:*",
		  "lambda:*",
		  "ecs:*",
		  "ec2:*",
		  "ecr:*",
		  "events:*"
	    ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_security_group" "ec2_security_group" {
    name = "regn-sg-${var.SysName_tag}-installer"
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
        cidr_blocks = "${var.ssh_source_cidr_block}"
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
        cidr_blocks = "${var.ssh_source_cidr_block}"
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        self = true
    }

}




