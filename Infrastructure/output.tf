output "instance_availability_zone" {
  description = "List of availability zones of instances"
  value       = "${aws_instance.server.availability_zone}"
}
output "instance_id" {
  description = "List of IDs of instances"
  value       = "${aws_instance.server.id}"
}
output "instance_ip" {
  description = "List of IP of instance"
  value       = "${aws_instance.server.private_ip}"
}
output "security_group_id" {
  value = "${aws_security_group.ec2_security_group.id}"
}
