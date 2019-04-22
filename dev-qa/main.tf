module "vpc" {
  source = "../modules/vpc"

  //Region and keys
  region = "us-east-2"
  secret_key = ""// need to give as input
  access_key = "" // need to give as input

  //vpc
  vpc_cidr = "10.10.0.0/16"
  tenancy = "default"
  tag_name = "myvpc"

  //subnet
  vpc_id = "${module.vpc.vpc_id}"
  subnet_cidr = "10.10.1.0/24"
}

module "security_group" {
  source = "../modules/security_group"

  //security group
  security_group_name = "mysecuritygroup"
  vpc_id = "${module.vpc.vpc_id}"
  security_group_tags = {
    Name = "mysecuritygroup"
  }
  subnet_ids = "${module.vpc.subnet_id}"
}

module "es" {
  source = "../modules/es"
  domain_name = "my-elasticsearch-domain"
  management_public_ip_addresses = ["34.203.XXX.YYY"]
  instance_count = 4
  instance_type = "m4.2xlarge.elasticsearch"
  dedicated_master_type = "m4.large.elasticsearch"
  es_zone_awareness = true
  ebs_volume_size = 100
}