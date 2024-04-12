terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.0.0, <6.0.0"
    }
  }
  required_version = "~>1.7.0"
}

provider "aws" {
  profile = "Adri"
}

provider "aws" {
  profile = "Adri"
  region = "eu-west-1"
  alias = "ireland"
}