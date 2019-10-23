resource "aws_instance" "pacbot_server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.key-pair}"
   subnet_id = "${var.subnetId}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   user_data = "${file("userdata.sh")}"
}

