resource "aws_instance" "_" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet._.id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = aws_key_pair._.key_name
  vpc_security_group_ids      = [aws_security_group._.id]

    tags = {
      Name                    = var.name
    }
}

resource "aws_eip" "_" {
  vpc                         = var.aws_eip_vpc
  instance                    = aws_instance._.id
}

resource "aws_key_pair" "_" {
  key_name                    = var.key_name
  public_key                  = file("~/.ssh/id_rsa.pub")
}

resource "aws_subnet" "_" {
  cidr_block                  = var.cidr_block
  availability_zone           = var.availability_zone
  map_public_ip_on_launch     = var.map_public_ip_on_launch
  vpc_id                      = var.vpc_id
}

resource "aws_security_group" "_" {
  name = "Jenkins-EC2-SG"

  description = "Jenkins security group"
  vpc_id      = var.vpc_id

  # Allow inbound SSH traffic (port 22) for Ansible configuration.
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Telnet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic for Jenkins (port 8080).
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "Telnet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}