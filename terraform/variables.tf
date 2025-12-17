variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "az_a" {
  type    = string
  default = "us-east-1a"
}
variable "az_b" {
  type    = string
  default = "us-east-1b"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_a_cidr" {
  type    = string
  default = "10.0.0.0/24"
}
variable "private_subnet_a_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_b_cidr" {
  type    = string
  default = "10.0.2.0/24"
}
variable "private_subnet_b_cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "ami_id" {
  type    = string
  default = "ami-068c0051b15cdb816"
}
variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type    = string
  default = "appdb"
}
variable "db_username" {
  type    = string
  default = "appuser"
}
variable "db_password" {
  type      = string
  sensitive = true
  default   = "Test123*"
}