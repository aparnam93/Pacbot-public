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

