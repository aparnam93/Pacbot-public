output "instance_availability_zone" {
  description = "List of availability zones of instances"
  value       = "${aws_instance.instance.availability_zone}"
}
output "instance_id" {
  description = "List of IDs of instances"
  value       = "${aws_instance.instance.id}"
}
output "instance_ip" {
  description = "List of IP of instance"
  value       = "${aws_instance.instance.private_ip}"
}
