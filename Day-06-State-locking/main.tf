resource "aws_instance" "name" {
    ami = "ami-031283482dcfced88"
    tags = {
      Name = "Dev"
    }
   instance_type = "t3.small"
}

