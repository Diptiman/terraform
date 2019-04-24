module "vote_service_sg" {
source = "terraform-aws-modules/security-group/aws"

name = "user-service"
description = "Security group for user-service with custom ports open within VPC, and access ElasticSearch"
vpc_id = "vpc-06c625f598c456908"

ingress_cidr_blocks = ["10.10.0.0/16"]
ingress_rules = ["https-443-tcp"]
ingress_with_cidr_blocks = [
{
from_port = 9200
to_port = 9200
protocol = "tcp"
description = "User-service ports"
cidr_blocks = "0.0.0.0/0"
}
]
}