resource "aws_vpc" "MyVpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "prod"
  }
}

resource "aws_subnet" "prod" {
  vpc_id = aws_vpc.MyVpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "prod-subnet"
  }
  
}