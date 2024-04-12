provider "aws" {
  profile = "Adri"
}
resource "aws_s3_bucket" "bucket" {
  bucket = "example-adrcanfer-${random_string.sufix.result}"

  tags = {
    "attribute" = "value"
  }

}

resource "random_string" "sufix" {
  length  = 8
  special = false
  numeric = false
  upper   = false
  lower   = true
}
