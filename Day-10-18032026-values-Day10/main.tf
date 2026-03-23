module "dev" {
    source = "../Day-10-passing-variables"
    ami_id = "subnet-09a36d470527927fa"
    instance_type = "t2.micro" 
}