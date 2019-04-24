module "es" {
  source                         = "tf_aws_elasticsearch"
  domain_name                    = "elasticsearch-domain"
  management_public_ip_addresses = ["*"]
  instance_count                 = 4
  instance_type                  = "t2.small.elasticsearch"
  dedicated_master_type          = "t2.small.elasticsearch"
  es_zone_awareness              = true
  ebs_volume_size                = 10
  create_iam_service_linked_role = false
}