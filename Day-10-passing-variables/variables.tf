variable "ami_id" {
     default = "ami-02dfbd4ff395f2a1b"
}
variable "instance_type" {
    default = "t3.micro"
}
variable "subnet_id" {
    default = "subnet-0c15f5355c11f4de1"
}

# variable "key_name" {
#   default = "myinstance20032026"
  
# }
# variable "name" {   
#   default = "myinstance20032026"
# }


# # Networking
# variable "security_group_ids" {
#   default = []
# }
# variable "public_ip" {
#   default = true
# }

# # Access
# variable "key_name" {
#   description = "SSH key pair"
#   default = ""
# }

# # IAM
# variable "iam_instance_profile" {
#   default = null
# }

# # Storage
# variable "volume_size" {
#   default = 8
# }
# variable "volume_type" {
#   default = "gp3"
# }

# variable "device_name" {
#   default = "/dev/sdf"
# }
# variable "ebs_volume_size" {
#   default = 10
# }
# variable "ebs_volume_type" {
#   default = "gp3"
# }

# # Monitoring
# variable "enable_monitoring" {
#   default = false
# }

# # User data (startup script)
# variable "user_data" {
#   default = ""
# }

# # Tags
# variable "tags" {
#   type    = map(string)
#   default = {}
# }