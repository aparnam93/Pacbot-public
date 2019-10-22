resource "aws_instance" "jenkins-server" {
   ami = "${var.ami}"
   instance_type = "t2.large"
   key_name = "${var.ami}"
   subnet_id = "${var.subnetId}"
   vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
   iam_instance_profile = "${aws_iam_instance_profile.jenkins_instance_profile.name}"
   source_dest_check = false
   user_data = "${file("userdata.sh")}"
   tags {
     Name = "jenkins-server"
     Application = "Jenkins-server"
     Environment = "Dev"
     SysName = "Jenkins"
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
  instance = "${aws_instance.server.id}"
  vpc      = true
}


# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket =  "${var.s3BucketName}"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "S3 Remote Terraform State Store"
      Application = "Terraform-state"
      Environment = "Dev"
      SysName = "Terraform-state"
      Scheduler = ""
      Monitoring = "Null"
      SSMManged = "False"
      Patch Group = "False"
      TSM = "aparna.manjunath@regeneron.com"
      SysOwner = "aparna.manjunath@regeneron.com"
      CostCenter = "0512"
    }      
}

resource "aws_dynamodb_table" "common-terraform-state-lock" {
  name           = "${var.StateLockDbName}"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB Terraform State Lock Table"
	Application = "Terraform-state-lock-table"
    Environment = "Dev"
    SysName = "Terraform-state-lock-table"
    Scheduler = ""
    Monitoring = "Null"
    SSMManged = "False"
    Patch Group = "False"
    TSM = "aparna.manjunath@regeneron.com"
    SysOwner = "aparna.manjunath@regeneron.com"
    CostCenter = "0512"
  }
}


resource "aws_iam_role" "jenkins_server_role" {
  name = "jenkins_server_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "jenkins_instance_profile"
  role = "${aws_iam_role.jenkins_server_role.name}"
}
resource "aws_iam_role_policy" "jenkins_server_policy" {
  name = "jenkins_server_policy"
  role = "${aws_iam_role.jenkins_server_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1571402648437",
      "Action": [
        "ec2:AssociateIamInstanceProfile",
        "ec2:AssociateRouteTable",
        "ec2:AttachInternetGateway",
        "ec2:CreateKeyPair",
        "ec2:CreateNatGateway",
        "ec2:CreateNetworkAcl",
        "ec2:CreateRoute",
        "ec2:CreateRouteTable",
        "ec2:CreateSecurityGroup",
        "ec2:CreateSubnet",
        "ec2:CreateTags",
        "ec2:CreateVpc",
        "ec2:RunInstances",
        "ec2:StartInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Sid": "Stmt1571402851479",
      "Action": [
        "iam:AddRoleToInstanceProfile",
        "iam:AttachRolePolicy",
        "iam:CreateInstanceProfile",
        "iam:CreatePolicy",
        "iam:CreateRole",
        "iam:GetPolicy",
        "iam:GetRole",
        "iam:ListPolicies",
        "iam:ListRolePolicies",
        "iam:PutRolePolicy",
        "iam:UpdateRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


