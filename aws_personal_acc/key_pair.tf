resource "tls_private_key" "node_key_pairs" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "node_key_pair" {
  public_key = tls_private_key.node_key_pairs.public_key_openssh
}

resource "aws_ssm_parameter" "node_ssh_private_key" {
  provider = aws
  name     = "node-group/ssh-private-key"
  type     = "SecureString"
  value    = tls_private_key.node_key_pairs.private_key_pem
  key_id   = var.my_ssm_kms_data_key
}

output "ssh_private_key" {
  sensitive   = true
  description = "private key to access EKS node group over SSH"
  value       = tls_private_key.node_key_pairs.private_key_pem
}