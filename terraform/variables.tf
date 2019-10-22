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
  default = "ec2-creation-dev"
}

variable "VPCID" {
  description = "VPC Id for instance"
  default = "vpc-78fb0803"
}

variable "subnetId" {
  description = "Subnet Id for instance"
  default = "subnet-b28a83f9"
}

variable "s3BucketName" {
  description = "S3 bucket name to store state file"
  default = "terraform-state-storage-s3"
}

variable "StateLockDbName" {
  description = "DB Name which store the state lock"
  default = "terraform-aws-tf-state-store-lock"
}
