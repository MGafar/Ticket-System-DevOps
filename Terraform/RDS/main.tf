resource "aws_db_instance" "_" {
  allocated_storage        = var.rds_allocated_storage
  db_subnet_group_name     = aws_db_subnet_group._.name
  delete_automated_backups = var.rds_delete_automated_backups
  engine                   = var.rds_engine
  engine_version           = var.rds_engine_version
  instance_class           = var.rds_instace_class
  identifier               = var.rds_identifier
  name                     = var.rds_db_name
  username                 = var.rds_username
  password                 = random_password._.result
  parameter_group_name     = var.rds_parameter_group_name
  vpc_security_group_ids   = [aws_security_group._.id]
  skip_final_snapshot      = var.rds_skip_final_snapshot
  publicly_accessible      = var.rds_publicly_accessible

  tags = {
      Name                 = var.name
    }
}

resource "aws_subnet" "rds_subnet_1" {
  cidr_block               = var.cidr_block_1
  availability_zone        = var.availability_zone_1
  map_public_ip_on_launch  = var.map_public_ip_on_launch
  vpc_id                   = var.vpc_id
  
  tags = {
    Name = "RDS Subsnet 1"
  }
}

resource "aws_subnet" "rds_subnet_2" {
  cidr_block              = var.cidr_block_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_id                  = var.vpc_id

  tags = {
    Name = "RDS Subsnet 2"
  }
}

resource "random_password" "_" {
  length                  = var.password_length
  special                 = false
}

resource "aws_security_group" "_" {
  name                    = "RDS-Instance-SG"

  description             = "RDS security group"
  vpc_id                  = var.vpc_id

  # Allow inbound MySQL traffic (port 3306).
  ingress {
    from_port             = 3306
    to_port               = 3306
    protocol              = "tcp"
    description           = "MySQL"
    ipv6_cidr_blocks      = ["::/0"]
  }

  ingress {
    from_port             = 3306
    to_port               = 3306
    protocol              = "tcp"
    description           = "MySQL"
    cidr_blocks           = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port              = 0
    to_port                = 0
    protocol               = "-1"
    cidr_blocks            = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "_" {
  name                     = "rds_subnet_group"
  subnet_ids               = [aws_subnet.rds_subnet_1.id, aws_subnet.rds_subnet_2.id]

  tags = {
    Name                   = "RDS Subnet group"
  }
}