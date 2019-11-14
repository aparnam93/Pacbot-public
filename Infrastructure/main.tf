provider "aws" {
  region = "${var.region}"
}

module "Pacbot_ec2_role" {
  source = "modules/ec2_profile"
  ec2_iam_role_name = "${var.ec2_iam_role_name}"
  ec2_instance_profile_name = "${var.ec2_iam_role_name}"
  ec2_iam_role_policy_name = "${var.ec2_iam_role_name}"
  #regn_ssm_managed_role = "${var.regn_ssm_managed_role}"
}
module "Pacbot_sec_grp" {
  source = "modules/ec2_sec_grp"
  vpc_id = "${var.vpc_id}"
  ssh_source_ip = "${var.ssh_source_cidr_block}"
  SysName_tag = "${var.SysName_tag}"
}
module "Pacbot_key_pair" {
  source = "modules/ec2_key_pair"
  SysName_tag = "${var.SysName_tag}"
}

module "Pacbot_hf_node" {
  source = "modules/ec2_instance"
  SysName_tag = "${var.SysName_tag}"
  instance_type = "${var.instance_type_hf}"
  linux_base_ami = "${var.linux_base_ami}"
  sec_grp_id = "${module.Pacbot_sec_grp.security_group_id}"
  ssh_key_name = "${module.Pacbot_key_pair.ec2_key_pair}"
  vpc_subnet_id = "${var.vpc_subnet_id}"
  vpc_id = "${var.vpc_id}"
  ssh_source_ip = "${var.ssh_source_cidr_block}"
  hostname_tag = "${var.hostname_tag_hf}"
  #root_vol_size = "${var.root_vol_size_hf}"
  #root_vol_type = "${var.root_vol_type_hf}"
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
