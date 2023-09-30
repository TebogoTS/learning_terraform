resource "aws_instance" "my-instance" {
  ami                    = var.ami_id
  instance_type          = "000.000"
  monitoring             = false
  vpc_security_group_ids = ["sg-0000"]
  subnet_id              = "subnet-00000"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}