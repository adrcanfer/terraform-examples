resource "aws_vpc" "vpc_london" {
  cidr_block = var.london_cidr
  tags = {
    "name" = "Example VPC"
  }
}

resource "aws_vpc" "vpc_ireland" {
  cidr_block = var.ireland_cidr
  tags = {
    "name" = "Example VPC"
  }
  provider = aws.ireland
}

