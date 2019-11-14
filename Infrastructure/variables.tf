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
variable "linux_base_ami" {
  default = "ami-00dc79254d0461090"
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
#variable "regn_ssm_managed_role" {
#  default = "arn:aws:iam::703834445914:policy/regn-cld-ssm-managed-instance-role-policy"
#}

# EC2 Tags
variable "BusinessUnit" {
  default = "GNA"
}
variable "tsm" {
  default = "aparna.m@regeneron.com"
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
  default = "pacbotapplication"
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
  default = "pacbotapplication"
}
variable "instance_type_hf" {
  default = "t3.large"
}
