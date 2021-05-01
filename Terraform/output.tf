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
  value = module.RDS.endpoint
}

output "rds_user" {
  value = module.RDS.username
}

output "rds_password" {
  value = module.RDS.password
}