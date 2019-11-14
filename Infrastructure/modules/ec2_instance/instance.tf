resource "aws_instance" "instance" {
  ami = "${var.linux_base_ami}"
  instance_type = "${var.instance_type}"
  iam_instance_profile = "${var.instance_profile}" 
  user_data = "${file("./userdata.sh")}"
  tags = {
    Name = "${var.hostname_tag}"
    BusinessUnit = "${var.BusinessUnit}"
    CostCenter = "${var.CostCenter}"
    Environment = "${var.Environment}"
    SysOwner = "${var.SysOwner}"
    SysName  = "${var.SysName}"
    Department = "${var.Department}"
    TSM = "${var.tsm}"
    Scheduler = "${var.Scheduler}"
    "/Patch Group/" = "${var.PatchGroup}"
  }
  subnet_id = "${var.vpc_subnet_id}"
  vpc_security_group_ids = ["${var.sec_grp_id}"]
  key_name = "${var.ssh_key_name}"
}

output "instance_availability_zone" {
  description = "List of availability zones of instances"
  value       = "${aws_instance.instance.availability_zone}"
}
output "instance_id" {
  description = "List of IDs of instances"
  value       = "${aws_instance.instance.id}"
}
