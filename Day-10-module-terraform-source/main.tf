module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t3.micro"
  subnet_id     = "subnet-0c15f5355c11f4de1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
