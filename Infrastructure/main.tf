
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

module "pacbot_installer_Server" {
  source = "modules/ec2_instance"
}
