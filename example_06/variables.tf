variable "london_cidr" {
    description = "CIDR VPC London"
    type = map(string)
    sensitive = false
}

variable "public_subnet_cidr" {
    description = "CIDR public subnet"
    type = map(string)
    sensitive = false
}

variable "private_subnet_cidr" {
    description = "CIDR private subnet"
    type = map(string)
    sensitive = false
}

/* variable "subnets_cidr" {
    description = "Lista de subnets"
    type = list(string)
} */

variable "tags" {
    description = "Tags de los recursos"
    type = map(string)
}

variable "sg_ingress_cidr" {
    description = "CIDR del ingress del Security Group"
    type = string
}

variable "ec2_specs" {
    description = "Parámetros de la instancia"
    type = map(string)
}

