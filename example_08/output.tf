output "ec2_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = [for instance in aws_instance.public_instance : instance.public_ip]
}

output "ec2_private_ip" {
  description = "IP privada de la instancia EC2"
  value       = [for instance in aws_instance.public_instance : instance.private_ip]
}

output "s3_arn" {
  value = module.my-bucket.aws_s3_bucket_arn
}
