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

module "Pacbot_ec2_role" {
  source = "modules/ec2_profile"
  ec2_iam_role_name = "${var.ec2_iam_role_name}"
  ec2_instance_profile_name = "${var.ec2_iam_role_name}"
  ec2_iam_role_policy_name = "${var.ec2_iam_role_name}"
}
module "pacbot_sec_grp" {
  source = "modules/ec2_sec_grp"
  vpc_id = "${var.vpc_id}"
  ssh_source_ip = "${var.ssh_source_cidr_block}"
  SysName_tag = "${var.SysName_tag}"
}

