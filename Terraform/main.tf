provider "aws" {
  region     = "eu-west-2"
}

module "vpc" {
  source = "./VPC"

  vpc_cidr = "11.0.0.0/16"

  route = [
    {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = module.vpc.gateway_id
      instance_id    = null
      nat_gateway_id = null
    }
  ]

  subnet_ids = [module.PublicSubnet.id, module.RDSSubnet1.id, module.RDSSubnet2.id]
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [module.RDSSubnet1.id, module.RDSSubnet2.id]

  tags = {
    Name = "RDS Subnet group"
  }
}

module "Jenkins" {
  source = "./EC2"

  key_name      = "terraform-ec2-key"
  instance_type = "t2.micro"
  ami = "ami-06178cf087598769c" #Red Hat Enterprise Linux 8 (HVM)
  subnet_id     = module.PublicSubnet.id

  vpc_security_group_ids = [aws_security_group.ec2.id]

  vpc_id = module.vpc.vpc_id
}

module "PublicSubnet" {
  source                  = "./Subnet"
  vpc_id                  = module.vpc.vpc_id
  cidr_block              = "11.0.1.0/24"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
}

module "RDSSubnet1" {
  source            = "./Subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "11.0.2.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true
}

module "RDSSubnet2" {
  source            = "./Subnet"
  vpc_id            = module.vpc.vpc_id
  cidr_block        = "11.0.3.0/24"
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true
}

resource "aws_db_instance" "RDSInstance" {
  allocated_storage        = 20
  db_subnet_group_name     = aws_db_subnet_group.rds_subnet_group.name
  delete_automated_backups = true
  engine                   = "mysql"
  engine_version           = "8.0.23"
  instance_class           = "db.t2.micro"
  identifier               = "tf-rds-identifier"
  username                 = "root"
  password                 = random_password.password.result
  parameter_group_name     = "default.mysql8.0"
  vpc_security_group_ids   = [aws_security_group.rds.id]
  skip_final_snapshot      = true
  publicly_accessible      = true
}

resource "random_password" "password" {
  length           = 16
  special          = false
}

resource "aws_security_group" "rds" {
  name = "terraform-rds-sg"

  description = "RDS security group (terraform-managed)"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    description = "MySQL"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    description = "MySQL"
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

resource "aws_security_group" "ec2" {
  name = "terraform-ec2-sg"

  description = "EC2 security group (terraform-managed)"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "Telnet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    description = "Telnet"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}