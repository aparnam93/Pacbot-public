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
