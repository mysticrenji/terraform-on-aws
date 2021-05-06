terraform {
  backend "s3" {
    bucket = "mysticrenji"
    key    = "terraform/terraform.tfstate"
    region = "us-west-2"
  }
}