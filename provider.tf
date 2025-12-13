terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.26.0"
    }
  }
  backend "s3" {
    bucket = "polarisstatebackend"
    key    = "state/dev.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}
