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

module "pacbot_installer_Server" {
  source = "modules/ec2_instance"
  SysName_tag = "${var.SysName_tag}"
  instance_type = "${var.instance_type}"
  rhel_base_ami = "${var.linux_base_ami}"
  sec_grp_id = "${module.pacbot_sec_grp.security_group_id}"
  ssh_key_name = "${var.ssh_key_name}"
  vpc_subnet_id = "${var.vpc_subnet_id}"
  vpc_id = "${var.vpc_id}"
  ssh_source_ip = "${var.ssh_source_cidr_block}"
  CostCenter = "${var.CostCenter}"
  BusinessUnit = "${var.BusinessUnit}"
  Environment = "${var.Environment}"
  SysOwner = "${var.SysOwner}"
  SysName  = "${var.SysName}"
  Department = "${var.Department}"
  tsm = "${var.tsm}"
  Scheduler = "${var.Scheduler}"
  PatchGroup = "${var.PatchGroup}"
  instance_profile = "${module.Pacbot_ec2_role.ec2_instance_profile}"
}
