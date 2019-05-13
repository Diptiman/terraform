
provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source = "../vpc"

  //Region and keys
  region = "us-east-2"
  secret_key = "qqbrLEstDfY96UuY+k8q+ic3NqvnpHSbrl2NunFa"// need to give as input
  access_key = "AKIAJDKRNEU3WCCDFI3Q" // need to give as input

  //vpc
  vpc_cidr = "10.10.0.0/16"
  tenancy = "default"
  tag_name = "myvpc"

  //subnet
  vpc_id = "${module.vpc.vpc_id}"
  subnet_cidr = "10.10.1.0/24"
}

module "security_group" {
  source = "../security_group"

  //security group
  security_group_name = "mysecuritygroup"
  vpc_id = "${module.vpc.vpc_id}"
  security_group_tags = {
    Name = "mysecuritygroup"
  }
  subnet_ids = "${module.vpc.subnet_id}"
}

