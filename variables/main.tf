terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.20"
    }
  }

  required_version = ">= 1.2.8"
}

provider "aws" {
  region = "us-east-1"
  profile = "aws_dev_personal"
}

resource "aws_instance" "my_dev_instance" {
  ami = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  tags = {
    Name = "Dev_server"
  }
}