variable "region" {
  default = "us-east-1"
}
variable "ec2_iam_role_name" {
  default = "packbot-server-ec2-role"
}
variable "vpc_id" {
  default = "vpc-07f81c6ecd24526e8"
}
variable "ssh_source_cidr_block" {
  type    = "list"
  default = ["172.16.0.0/12", "10.0.0.0/8"]
}
variable "SysName_tag" {
  default = "PacBot"
}
variable "vpc_subnet_id" {
  default = "subnet-00f6241c98bc8a331"
}
variable "linux_base_ami" {
  default = "ami-0b69ea66ff7391e80"
}

variable "ssh_key_name" {
  default = "pacbot-application"
}
variable "instance_type" {
  default = "t2.medium"
}
# EC2 Tags
variable "BusinessUnit" {
  default = "GNA"
}
variable "tsm" {
  default = "aparna.manjunath@regeneron.com"
}
variable "CostCenter" {
  default = "0512"
}
variable "Department" {
  default = "ISnT - Cloud Services"
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
  default = "aparna.manjunath@regeneron.com"
}
variable "SysName" {
  default = "PacBot"
}
#Hostname
variable "hostname_tag" {
  default = "Pacbot-Installer"
}
