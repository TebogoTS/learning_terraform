variable "ami_id" {
  type    = string
  default = "ami-0000"
}

variable "vpc_id" {
  type    = string
  default = "vpc-000000"
}

variable "kms_data_key_id" {
  type = string
}

variable "my_ssm_kms_data_key" {
  type    = string
  default = ""
}