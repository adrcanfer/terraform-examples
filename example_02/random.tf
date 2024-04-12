resource "random_string" "sufijo" {
  count   = 5
  length  = 4
  special = false
  numeric = false
  upper   = true
  lower   = false
}
