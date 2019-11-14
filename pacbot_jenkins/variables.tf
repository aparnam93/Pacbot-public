variable "region" {
  default = "us-east-1"
}
variable "vpc_id" {
  default = "vpc-78fb0803"
}
variable "ssh_source_cidr_block" {
  type    = "list"
  default = ["172.16.0.0/12", "10.0.0.0/8"]
}
variable "vpc_subnet_id" {
  default = "subnet-b28a83f9"
}
variable "rhel_base_ami" {
  default = "ami-0ca877ece91b62785"
}
variable "SysName_tag" {
  default = "PacBot"
}
variable "ssh_key_name" {
  default = "ec2-creation-dev"
}
variable "instance_type" {
  default = "t3.large"
}
variable "ec2_iam_role_name" {
  default = "packbot-jenkins-ec2-role"
}
variable "regn_ssm_managed_role" {
  default = "arn:aws:iam::703834445914:policy/regn-cld-ssm-managed-instance-role-policy"
}
variable "root_vol_size" {
  default = "100"
}
variable "root_vol_type" {
  default = "standard"
}
# EC2 Tags
variable "BusinessUnit" {
  default = "GNA"
}
variable "tsm" {
  default = "sanjay.sreeram1@regeneron.com"
}
variable "CostCenter" {
  default = "0512"
}
variable "Department" {
  default = "Technology Enablement"
}
variable "Environment" {
  default = "DEV"
}
variable "Scheduler" {
  default = "S-C-US-NT18A-OD"
}
variable "PatchGroup" {
 default = "cat3"
}
variable "SysOwner" {
  default = "rakesh.singh@regeneron.com"
}
variable "SysName" {
  default = "PacBot"
}
#Hostname
variable "hostname_tag" {
  default = "AUSLAJNKNS01D"
}
# secondary ebs vol specs
variable "non_root_volume_type" {
  default = "standard"
}
#variable "non_root_volume_size" {
#  default = "2048"
#}
#variable "non_root_vol_device_name" {
#  default = "/dev/sdf"
#}
#### "AUSLAJNKNS01D" specific variables
variable "hostname_tag_hf" {
  default = "AUSLAJNKNS01D"
}
variable "instance_type_hf" {
  default = "t3.large"
}
variable "root_vol_size_hf" {
  default = "100"
}
variable "root_vol_type_hf" {
  default = "standard"
}
# secondary ebs vol specs
variable "non_root_volume_type_hf" {
  default = "standard"
}
variable "non_root_volume_size_hf" {
  default = "500"
}
variable "non_root_vol_device_name_hf" {
  default = "/dev/sdf"
}
