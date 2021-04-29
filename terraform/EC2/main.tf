# locals {
#   resource_name_prefix = "${var.namespace}-${var.resource_tag_name}"
# }

resource "aws_instance" "_" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = aws_key_pair._.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids

}

resource "aws_eip" "_" {
  vpc      = true
  instance = aws_instance._.id
}

# resource "tls_private_key" "_" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

resource "aws_key_pair" "_" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsqQ657++GP1dnnl3wp/lDrvXQV4ZHqhDo/W8mf8AJC0NAYHSOHWV0QgcLr4XTg9WYiuRvxKY8vMTgnDhSI4LjSRx16hC0htjS7o4I+MHNIpiFxO62/FSmsEQVMzlkRIDcYN3s/m/2EkeRm1IBxDLSaZQbaxVjhs1kn4HEYLOBMotbvhLv0+p2WIzrUUdBmuqMDRIowpEE/Y+3K8Ck9u2VPWvR3pZS7DEjfEgheazK7ib20h3Y0Lurzv4koqwRNkeH08Z7tTeuq3noGaR2kQlTawxHo77DA7i3eAiShN3kf1JnctnPRfLSXrqZQf8roC2cHaFWsdO3yi6iChh7nwT/ ubuntu@ip-172-31-47-214"
}

