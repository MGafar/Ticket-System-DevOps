output "ec2_id" {
  value = aws_instance._.id
}

output "ec2_public_key" {
  value = aws_key_pair._.public_key
}

output "ec2_public_ip" {
  value = aws_eip._.public_ip
}

