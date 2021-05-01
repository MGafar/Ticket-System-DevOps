output "endpoint" {
  value = aws_db_instance._.endpoint
}

output "username" {
  value = aws_db_instance._.username
}

output "password" {
  value = aws_db_instance._.password
}

output "subnet_1_id" {
  value = aws_subnet.rds_subnet_1.id
}

output "subnet_2_id" {
  value = aws_subnet.rds_subnet_2.id
}