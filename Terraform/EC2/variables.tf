variable "ami" {
    default = "ami-0244a5621d426859b" # Ubuntu Server 18.04 LTS
}

variable "resource_tag_name" {
    default = ""
}

variable "namespace" {
    default = ""
}

variable "region" {
    default = ""
}

variable "key_name" {
    default = ""
}

variable "instance_type" {
    default = ""
}

variable "subnet_id" {
    default = ""
}

variable "vpc_security_group_ids" {
    default = ""
}

variable "associate_public_ip_address" {
    default = true
}

variable "vpc_id" {
    default = ""
}