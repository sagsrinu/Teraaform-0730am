#Key Pair
resource "aws_key_pair" "key1" {
  key_name = "test"
  public_key = file("~/.ssh/id_rsa.pub")
}
#VPC
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "MyVPC"
    }
}
#Subnet
resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    #map_customer_owned_ip_on_launch = true
    map_public_ip_on_launch = true

    tags ={
        Name = "Public Subnet"
    }  
}
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

# Route Table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate Route Table
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.dev.id
  route_table_id = aws_route_table.RT.id
}

# Security Group
resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

    ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "server" {
  ami = "ami-02dfbd4ff395f2a1b"
  instance_type = "t2.small"
  key_name                    = aws_key_pair.key1.key_name
  subnet_id                   = aws_subnet.dev.id
  vpc_security_group_ids      = [aws_security_group.webSg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Linux"
  }


  connection {
    type        = "ssh"
    user        = "ec2-user"                          # ✅ Correct for Ubuntu AMIs
    private_key = file("~/.ssh/id_rsa")             # Path to private key
    host        = self.public_ip
    timeout     = "2m"
  }


  provisioner "file" {
    source      = "file10"
    destination = "/home/ec2-user/file10"
  }
# Go to remot path and create the file
# add the content
  provisioner "remote-exec" {
    inline = [
      "touch /home/ec2-user/file200",
      "echo 'hello from veera nareshit hyd' >> /home/ec2-user/file200"
    ]
  }
  # File will be created wherever you run the terraform apply command
   provisioner "local-exec" {
    command = "touch file500"    
 }

}