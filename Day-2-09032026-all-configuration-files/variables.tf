variable "ami_id" {
    description = "Passing value to ami_id"
    default = "ami-02dfbd4ff395f2a1b"
    type = string
  
}
variable "instance_type" {
    description = "Passing Instance Type"
    default = "t2.micro"
    type = string
  
}