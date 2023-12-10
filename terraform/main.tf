provider "aws" {
  profile = "default"
}

resource "aws_instance" "master" {
  instance_type          = "t2.micro"
  ami                    = "ami-06aa3f7caf3a30282"
  count                  = 1
  vpc_security_group_ids = ["sg-0845bad5c6caabd01", ]
  user_data              = file("jen.sh")
  key_name               = "new"
  tags = {
    Name    = "jen"
    project = "star-agile-banking-finance"
  }
}

resource "aws_instance" "worker" {
  instance_type          = "t2.micro"
  ami                    = "ami-06aa3f7caf3a30282"
  count                  = 1
  vpc_security_group_ids = ["sg-0845bad5c6caabd01", ]
  user_data              = file("slave.sh")
  key_name               = "new"
  tags = {
    Name    = "slave"
    project = "star-agile-banking-finance"
  }
}

