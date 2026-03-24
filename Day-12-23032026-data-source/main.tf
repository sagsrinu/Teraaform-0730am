data "aws_instances" "source" {
  filter {
    name   = "tag:Name"
    values = ["dev-instance"]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

data "aws_instance" "source" {
  instance_id = data.aws_instances.source.ids[0]
}

resource "aws_instance" "new" {
  ami           = data.aws_instance.source.ami
  instance_type = data.aws_instance.source.instance_type

  tags = {
    Name = "cloned-instance"
  }
}