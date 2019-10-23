resource "aws_instance" "pacbot-server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.ami}"
}

resource "aws_eip" "lb" {
  instance = "${aws_instance.pacbot-server.id}"
  vpc      = true
}



