resource "aws_instance" "pacbot_server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.key-pair}"
   subnet_id = "${var.subnetId}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   iam_instance_profile = "${aws_iam_instance_profile.pacbot_ec2_instance_profile.name}"
   user_data = "${file("userdata.sh")}"
   tags {
     Name = "Pacbot-server"
   }
}

resource "aws_iam_role" "pacbot_ec2_server_role" {
  name = "pacbot_ec2_server_role"

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

resource "aws_iam_instance_profile" "pacbot_ec2_instance_profile" {
  name = "ec2_pacbot_instance_profile"
  role = "${aws_iam_role.pacbot_server_role.name}"
}
resource "aws_iam_role_policy" "pacbot_ec2_server_policy" {
  name = "pacbot_ec2_server_policy"
  role = "${aws_iam_role.pacbot_ec2_server_role.id}"

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
