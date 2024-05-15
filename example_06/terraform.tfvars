london_cidr = {
    "dev" = "172.10.0.0/16",
    "prod" = "10.10.0.0/16"
}
public_subnet_cidr = {
    "dev" = "172.10.0.0/24",
    "prod" = "10.10.0.0/24"
}

private_subnet_cidr = {
    "dev" = "172.10.1.0/24",
    "prod" = "10.10.1.0/24"
}

/* subnets_cidr = ["10.10.0.0/24", "10.10.1.0/24"] */

tags = {
    "env" = "dev"
    "owner" = "adrcanfer"
    "cloud" = "AWS"
    "IAC" = "Terraform"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
    "ami" = "ami-019a292cfb114a776",
    "instance_type" = "t2.micro"
}