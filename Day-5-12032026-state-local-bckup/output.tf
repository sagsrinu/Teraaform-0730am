output "dev_publicIp" {
  #value = aws_instance.name.public_ip
  value = aws_instance.dev.public_ip
}
output "dev_az" {
value = aws_instance.dev.availability_zone  
}

output "test_publicIp" {
  #value = aws_instance.name.public_ip
  value = aws_instance.test.public_ip
}
output "test_az" {
value = aws_instance.test.availability_zone  
}