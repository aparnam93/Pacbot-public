resource "aws_instance" "pacbot-server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.key-pair}"
}



