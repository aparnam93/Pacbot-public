resource "aws_instance" "pacbot_server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.key-pair}"
   subnet_id = "${var.subnetId}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   iam_instance_profile = "${aws_iam_instance_profile.pacbot_ec2_instance_profile_jenkins.name}"
   user_data = "${file("userdata.sh")}"
   tags = {
    Name = "${var.hostname_tag}"
    BusinessUnit = "${var.BusinessUnit}"
    CostCenter = "${var.CostCenter}"
    Environment = "${var.Environment}"
    SysOwner = "${var.SysOwner}"
    SysName  = "${var.SysName}"
    Department = "${var.Department}"
    TSM = "${var.tsm}"
    "/Patch Group/" = "${var.PatchGroup}"
  }
}

resource "aws_iam_role" "pacbot_ec2_server_role_jenkins" {
  name = "pacbot_ec2_server_role_jenkins"

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

resource "aws_iam_instance_profile" "pacbot_ec2_instance_profile_jenkins" {
  name = "ec2_pacbot_instance_profile_jenkins"
  role = "${aws_iam_role.pacbot_ec2_server_role_jenkins.name}"
}
resource "aws_iam_role_policy" "pacbot_ec2_server_policy_jenkins" {
  name = "pacbot_ec2_server_policy_jenkins"
  role = "${aws_iam_role.pacbot_ec2_server_role_jenkins.id}"

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

