resource "aws_vpc" "vpc_london" {
  cidr_block = "10.10.0.0/16"
  tags = {
    "name" = "Example VPC"
  }
}

resource "aws_vpc" "vpc_ireland" {
  cidr_block = "10.20.0.0/16"
  tags = {
    "name" = "Example VPC"
  }
  provider = aws.ireland
}