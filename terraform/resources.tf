resource "aws_instance" "pacbot-server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.key-pair}"
   subnet_id = "${aws_subnet.subnetId.id}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   user_data = "${file("userdata.sh")}"
}


resource "aws_eip" "lb" {
  instance = "${aws_instance.pacbot-server.id}"
  vpc      = true
}
