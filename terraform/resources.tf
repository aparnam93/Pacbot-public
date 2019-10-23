resource "aws_instance" "pacbot-server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.key-pair}"
   subnet_id = "${var.subnetId}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   source_dest_check = false
   user_data = "${file("userdata.sh")}"
   tags {
     Name = "pacbot-server"
     Application = "pacbot-server"
     Environment = "Dev"
     SysName = "Pacbot"
     Scheduler = ""
     Backup = "Backup"
     Monitoring = "Null"
     SSMManged = "False"
     Patch Group = "False"
     TSM = "aparna.manjunath@regeneron.com"
     SysOwner = "aparna.manjunath@regeneron.com"
     CostCenter = "0512"
  }
}

resource "aws_eip" "lb" {
  instance = "${aws_instance.pacbot-server.id}"
  vpc      = true
}



