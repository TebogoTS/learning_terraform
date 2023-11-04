terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20"
    }
  }

  required_version = ">= 1.2.8"
}

provider "aws" {
  region  = "us-east-1"
  profile = "aws_dev_personal"
}

resource "aws_security_group" "instance" {
  name = "web-server"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_launch_configuration" "web_server-LT" {
  image_id        = "ami-03a6eaae9938c858c"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_autoscaling_group" "web_server-ASG" {
  launch_configuration = aws_launch_configuration.web_server-LT.name
  vpc_zone_identifier  = data.aws_subnets.default.ids

  target_group_arns = [aws_lb_target_group.alb_asg.arn]
  health_check_type = "ELB"

  min_size = 1
  max_size = 2

  tag {
    key                 = "Name"
    value               = "webserve-asg"
    propagate_at_launch = true
  }
}

