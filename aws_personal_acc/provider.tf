terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "4.30.0"
      configuration_aliases = [aws.ssm]
    }
  }
}

provider "tls" {
  proxy {
    from_env = true
  }
}
