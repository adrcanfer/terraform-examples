resource "aws_vpc" "vpc_london" {
  #cidr_block = var.london_cidr
  cidr_block = lookup(var.london_cidr, terraform.workspace)
  tags = {
    "name" = "Example VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_london.id
  cidr_block = lookup(var.public_subnet_cidr, terraform.workspace)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Subnet pública_temp"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_london.id
  cidr_block = lookup(var.private_subnet_cidr, terraform.workspace)
  tags = {
    "Name" = "Subnet privada_temp"
  }
  depends_on = [ 
    aws_instance.public_instance,
    aws_subnet.public_subnet
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_london.id

  tags = {
    Name = "IGW VPC London"
  }
}


resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_london.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "Public route table"
  }
}

resource "aws_main_route_table_association" "public_crta" {
  vpc_id         = aws_vpc.vpc_london.id
  route_table_id = aws_route_table.public_crt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance Security Group"
  description = "Allow SSH over Internet"
  vpc_id      = aws_vpc.vpc_london.id

  tags = {
    Name = "Public Instance Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg_public_instance.id
  cidr_ipv4         = var.sg_ingress_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_public_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}




