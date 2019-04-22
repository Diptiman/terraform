variable "region" {
  default = "us-east-2"
  description = "Region"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "tenancy" {
  default = "dedicated"
}

variable "tag_name" {
  default = "motocho_elasticsearch_vpc"
}

variable "vpc_id" {}

variable "subnet_cidr" {
  default = "10.10.1.0/24"
}

variable "access_key" {}

variable "secret_key" {}