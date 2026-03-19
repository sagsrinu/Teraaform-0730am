resource "aws_s3_bucket" "bucket1903202612" {
   bucket = "bucket1903202612" 
}
resource "aws_vpc" "Dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "Dev"
  }
  depends_on = [ aws_s3_bucket.bucket1903202612 ]
}

resource "aws_iam_role" "ec2-full" {
  name = "ec2-full"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
  depends_on = [ aws_vpc.Dev ]
}
