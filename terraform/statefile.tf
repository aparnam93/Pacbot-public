terraform {
  backend "s3" {
  # Replace this with your bucket name!
    bucket         = "${var.s3BucketName}"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
