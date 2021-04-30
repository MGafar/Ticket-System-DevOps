output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_id" {
  value = module.ec2.ec2_id
}

output "ec2_public_key" {
  value = module.ec2.ec2_public_key
}

output "rds_endpoint" {
  value = aws_db_instance.RDSInstance.endpoint
}