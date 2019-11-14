resource "aws_key_pair" "ec2_key_pair" {
    key_name   = "regn-sg-${var.SysName_tag}-pacbot"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeMWvHhOn9xzZrR56Y4+eT9jmNjix4bppPYxc1OYkz8i2QK+2hU0GBuJELyo5XYYKjgSlUC/MKcx7V+V6mcTx8Sc+9+hj6ameZFPZMhj58gI7Cki+tmrxK4i9f7vS/A9ITcB48c+/b3PSgvJVFqPo35HeBonzWk+SHP0AoMevuIbLbNIDABpOzG1q+tzKGVLVgEhK6UzOA5+YG9UJadDdhxqBGev4Ay8IimoGt3gyi1ZFko+vB+5wAiwm5lTXVjZd19JOj8D4/cyo+JOXBFwu6FN4ZrUmDJOdjW6PxWEuiYDskyiB1BfjneZ5Ikw2Qioh3EdERpWW/lZAy9LJvjyVv pacbot-application-key"
}
output "ec2_key_pair" {
  value = "${aws_key_pair.ec2_key_pair.key_name}"
}

