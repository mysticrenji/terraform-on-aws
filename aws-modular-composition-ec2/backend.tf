terraform {
  backend "s3" {
    bucket = "mysticrenji"
    key    = "terraform/terraformec2.tfstate"
    region = "us-west-2"
  }
}