terraform {
  backend "s3" {
    bucket = "regn-terraform-prod-state-store"
    key = "us-east-1/703834445914/packbot_jenkins.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "${var.region}"
}

module "Jenkins_ec2_role" {
  source = "modules/ec2_profile"
  ec2_iam_role_name = "${var.ec2_iam_role_name}"
  ec2_instance_profile_name = "${var.ec2_iam_role_name}"
  ec2_iam_role_policy_name = "${var.ec2_iam_role_name}"
  regn_ssm_managed_role = "${var.regn_ssm_managed_role}"
}
module "Jenkins_sec_grp" {
  source = "modules/ec2_sec_grp"
  vpc_id = "${var.vpc_id}"
  ssh_source_ip = "${var.ssh_source_cidr_block}"
  SysName_tag = "${var.SysName_tag}"
}


module "Jenkins_hf_node" {
  source = "modules/ec2_instance"
  SysName_tag = "${var.SysName_tag}"
  instance_type = "${var.instance_type_hf}"
  rhel_base_ami = "${var.rhel_base_ami}"
  sec_grp_id = "${module.Jenkins_sec_grp.security_group_id}"
  ssh_key_name = "${var.ssh_key_name}"
  vpc_subnet_id = "${var.vpc_subnet_id}"
  vpc_id = "${var.vpc_id}"
  ssh_source_ip = "${var.ssh_source_cidr_block}"
  hostname_tag = "${var.hostname_tag_hf}"
  root_vol_size = "${var.root_vol_size_hf}"
  root_vol_type = "${var.root_vol_type_hf}"
  CostCenter = "${var.CostCenter}"
  BusinessUnit = "${var.BusinessUnit}"
  Environment = "${var.Environment}"
  SysOwner = "${var.SysOwner}"
  SysName  = "${var.SysName}"
  Department = "${var.Department}"
  tsm = "${var.tsm}"
  Scheduler = "${var.Scheduler}"
  PatchGroup = "${var.PatchGroup}"
  instance_profile = "${module.Jenkins_ec2_role.ec2_instance_profile}"
}
