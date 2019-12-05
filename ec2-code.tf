# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["BastionHost"]
  }

  owners = ["792304536015"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t3.medium"
  subnet_id     = "subnet-04fc0065dd95757bf"
  security_groups = ["sg-094cea61a776c0ac7"]
  key_name        = "bastionhost-kp"
  tags = {
    Name = "BastionHost"
  }
}
