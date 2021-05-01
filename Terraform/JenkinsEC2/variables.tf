variable "ami" {
    default = "ami-06178cf087598769c" #Red Hat Enterprise Linux 8 (HVM)
}

variable "name" {
    default = "JenkinsEC2"
}

variable "resource_tag_name" {
    default = "tf-jenkins-ec2"
}

variable "region" {
    default = "eu-west-2"
}

variable "aws_eip_vpc" {
    default = true
}

variable "key_name" {
    default = "Jenkins EC2 Key"
}

variable "instance_type" {
    default = "t2.small"
}

variable "associate_public_ip_address" {
    default = true
}

variable "vpc_id" {
    default = ""
}

variable cidr_block {
    default = "11.0.1.0/24"
}

variable "availability_zone" {
    default = "eu-west-2a"
}

variable "map_public_ip_on_launch" {
    default = true
}