terraform {
  
  backend "s3" {
    bucket = "statefile-terraform-15032026"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}