output "publicIp" {
  value = aws_instance.name.public_ip
}
output "az" {
value = aws_instance.name.availability_zone  
}