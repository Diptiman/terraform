variable "enabled" {
  default     = "true"
  description = "Set to false to prevent the module from creating any resources"
}

variable "security_group_name" {
  default     = "security_group"
}

variable "security_group_tags" {
  type        = "map"
  default     = {}
}

variable "security_groups" {
  type        = "list"
  default     = []
  description = "List of security group IDs to be allowed to connect to the cluster"
}

variable "allowed_cidr_blocks" {
  type        = "list"
  default     = []
  description = "List of CIDR blocks to be allowed to connect to the cluster"
}

variable "vpc_id" {}

variable "subnet_ids" {
  type        = "list"
  description = "Subnet ids"
}