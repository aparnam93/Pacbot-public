variable "region" {
  default = "us-east-1"
}
variable "ec2_iam_role_name" {
  default = "packbot-server-ec2-role"
}
variable "regn_ssm_managed_role" {
  default = "arn:aws:iam::703834445914:policy/regn-cld-ssm-managed-instance-role-policy"
}
variable "vpc_id" {
  default = "vpc-07f81c6ecd24526e8"
}
variable "ssh_source_cidr_block" {
  type    = "list"
  default = ["14.98.18.98/16"]
}
variable "SysName_tag" {
  default = "PacBot"
}

