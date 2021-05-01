variable "vpc_cidr" {
    default = "11.0.0.0/16"
}

variable "enable_dns_support" {
    default = true
}

variable "enable_dns_hostnames" {
    default = true
}

variable "vpc_name_tag" {
    default = "Ticket System VPC"
}

variable "igw_name_tag" {
    default = "Ticket System IGW"
}

variable "route" {
    default = []
}

variable "rt_name_tag" {
    default = "Ticket System RT"
}

variable "subnet_ids" {
    default = []
}

variable "resource_tag_name" {
    default = ""
}