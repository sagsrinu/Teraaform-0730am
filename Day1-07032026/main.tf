
# Create a VPC
# resource "aws_vpc" "my_vpc_07032026" {
#   cidr_block           = "10.1.0.0/16"
#   #enable_dns_support   = true
#   #enable_dns_hostnames = true
#   tags = {
#     Name = "Myvpc07032026"
#   }
# }


# resource "aws_vpc" "Myvpc07032026" { 
#     cidr_block =        "10.0.0.0/16" 
#     tags = { 
#         Name = "Myvpc07032026"
#             } 
#      }
resource "aws_vpc" "Name" {
    cidr_block = "10.1.0.0/16"
    tags = {
      Name = "MyVpcTest1"
    }
}
