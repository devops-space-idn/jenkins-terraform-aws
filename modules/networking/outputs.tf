output "vpc_id" {
  description = "ID of the VPC created"
  value       = aws_vpc.belajar_vpc.id
}

output "public_subnet_id" {
  description = "ID of the public subnet created"
  value       = aws_subnet.belajar_public_1.id
}
