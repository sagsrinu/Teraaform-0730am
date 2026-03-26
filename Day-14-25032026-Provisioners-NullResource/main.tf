
resource "aws_instance" "server" {
  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = "t3.small"
  tags = {
    Name = "Linux-NulResource"
  }
}

resource "null_resource" "test" {
  provisioner "local-exec" {
    command = "touch fil102"    
}
  triggers = {
    always_run = "${timestamp()}" # Forces rerun every time
  }
  
}