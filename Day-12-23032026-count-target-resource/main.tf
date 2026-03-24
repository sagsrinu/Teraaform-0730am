variable "dev" {
  type = bool
  default = false
}
resource "aws_instance" "name" {
  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.micro"
  tags = {
    Name = "dev-instance"
  }
  count = var.dev ? 1:0
}

resource "aws_s3_bucket" "name" {
    bucket= "bucket24032026"
  
}