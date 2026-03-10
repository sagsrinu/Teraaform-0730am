resource "aws_instance" "name" {
    ami=var.ami_id 
    #instance_type = "t2.micro"
    instance_type = var.instance_type
    tags = {
        Name = "dev-instance"
    }
  
}