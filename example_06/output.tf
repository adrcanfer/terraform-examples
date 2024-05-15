output "ec2_public_ip" {
    description = "IP pública de la instancia EC2"
    value = aws_instance.public_instance.public_ip
}

output "ec2_private_ip" {
    description = "IP privada de la instancia EC2"
    value = aws_instance.public_instance.private_ip
}