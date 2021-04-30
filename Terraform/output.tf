output "vpc_id" {
  value = module.vpc.vpc_id
}

output "Jenkins_ec2_id" {
  value = module.Jenkins.ec2_id
}

output "Jenkins_ec2_public_key" {
  value = module.Jenkins.ec2_public_key
}

output "Jenkins_ec2_public_ip" {
  value = module.Jenkins.ec2_public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.RDSInstance.endpoint
}

output "rds_user" {
  value = aws_db_instance.RDSInstance.username
}

output "rds_password" {
  value = aws_db_instance.RDSInstance.password
}