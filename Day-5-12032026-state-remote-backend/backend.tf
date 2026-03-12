terraform {
  backend "s3" {
    bucket         = "teraform-code1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
