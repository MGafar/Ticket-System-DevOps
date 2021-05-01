variable "rds_allocated_storage" {
    default = 20
}

variable "rds_db_name" {
    default = "ticketsystem"
}

variable "rds_delete_automated_backups" {
    default = true
}

variable "name" {
    default = "RDS Instance"
}

variable "rds_engine" {
    default = "mysql"
}

variable "rds_engine_version" {
    default = "8.0.23"
}

variable "rds_instace_class" {
    default = "db.t2.micro"
}

variable "rds_identifier" {
    default = "rds-ticketsystem"
}

variable "rds_parameter_group_name" {
    default = "default.mysql8.0"
}

variable "rds_skip_final_snapshot" {
    default = true
}

variable "rds_publicly_accessible" {
    default = true
}

variable "vpc_id" {
    default = ""
}

variable "password_length"{
    default = 16
}

variable "map_public_ip_on_launch" {
    default = true
}

variable "cidr_block_1" {
    default = "11.0.2.0/24"
}

variable "cidr_block_2" {
    default = "11.0.3.0/24"
}

variable "availability_zone_1" {
    default = "eu-west-2b"
}

variable "availability_zone_2" {
    default = "eu-west-2c"
}

variable "rds_username" {
    default = "root"
}