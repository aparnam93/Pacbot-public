variable "aws_region" {
  description = "Region for the VPC"
  default = "us-east-1"
}
variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-0b69ea66ff7391e80"
}

variable "key-pair" {
  description = "Ec2 instance Key pair"
  default = "pacbot-application"
}

variable "VPCID" {
  description = "VPC Id for instance"
  default = "vpc-07f81c6ecd24526e8"
}

variable "subnetId" {
  description = "Subnet Id for instance"
  default = "subnet-00f6241c98bc8a331"
}
variable "hostname_tag" {
  default = "Pacbot_Installer_Server"
}
variable "BusinessUnit" {
  default = "GNA"
}
variable "CostCenter" {
  default = "0512"
}

variable "Environment" {
  default = "DEV"
}

variable "SysOwner" {
  default = "rakesh.singh@regeneron.com"
}
variable "SysName" {
  default = "PacBot"
}

variable "Department" {
  default = "Technology Enablement"
}

variable "tsm" {
  default = "sanjay.sreeram1@regeneron.com"
}
variable "PatchGroup" {
 default = "cat3"
}
