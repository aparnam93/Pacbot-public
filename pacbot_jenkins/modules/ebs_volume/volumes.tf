variable "volume_az" {}
variable "non_root_volume_type" {}
variable "non_root_volume_size" {}
variable "attachement_instance_id" {}
variable "non_root_vol_device_name" {}
variable "CostCenter" {}
variable "BusinessUnit" {}
variable "Environment" {}
variable "Department" {}
variable "SysName" {}
variable "SysOwner" {}
variable "hostname_tag" {}
variable "tsm" {}

resource "aws_ebs_volume" "non_root_volume" {
  availability_zone = "${var.volume_az}"
  type              = "${var.non_root_volume_type}"
  size              = "${var.non_root_volume_size}"
  encrypted = "true"
  kms_key_id = "arn:aws:kms:us-east-1:703834445914:key/827065f3-3e40-4a5b-99d2-58a2dfda5640"
  tags = {
    Name = "${var.hostname_tag}-${var.non_root_vol_device_name}"
    BusinessUnit = "${var.BusinessUnit}"
    CostCenter = "${var.CostCenter}"
    Environment = "${var.Environment}"
    SysOwner = "${var.SysOwner}"
    SysName  = "${var.SysName}"
    Department = "${var.Department}"
    TSM = "${var.tsm}"
  }
}

resource "aws_volume_attachment" "non_root_volume_attachment" {
  device_name = "${var.non_root_vol_device_name}"
  instance_id = "${var.attachement_instance_id}"
  volume_id   = "${aws_ebs_volume.non_root_volume.id}"
}
