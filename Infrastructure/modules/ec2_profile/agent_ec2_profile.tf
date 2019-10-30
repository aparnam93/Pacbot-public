resource "aws_iam_role" "ec2_iam_role" {
   name = "${var.ec2_iam_role_name}"
   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.ec2_instance_profile_name}"
  role = "${aws_iam_role.ec2_iam_role.name}"
}

resource "aws_iam_policy" "ec2_iam_policy" {
  name = "${var.ec2_iam_role_policy_name}"
  policy = "${file("./agent_policy.json")}"
}

resource "aws_iam_policy_attachment" "agent_policy" {
  name       = "${var.ec2_iam_role_policy_name}-attachment"
  roles      = ["${aws_iam_role.ec2_iam_role.name}"]
  policy_arn = "${aws_iam_policy.ec2_iam_policy.arn}"
}

output "ec2_instance_profile" {
  value = "${aws_iam_instance_profile.ec2_instance_profile.name}"
}