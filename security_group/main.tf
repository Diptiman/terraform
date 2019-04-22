resource "aws_security_group" "security_group" {
  count       = "${var.enabled == "true" ? 1 : 0}"
  vpc_id      = "${var.vpc_id}"
  name        = "${var.security_group_name}"
  description = "Allow inbound traffic from Security Groups and CIDRs. Allow all outbound traffic"
  tags        = "${var.security_group_tags}"
}

resource "aws_security_group_rule" "ingress_security_groups" {
  count                    = "${var.enabled == "true" ? length(var.security_groups) : 0}"
  description              = "Allow inbound traffic from Security Groups"
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = "${element(var.security_groups, count.index)}"
  security_group_id        = "${join("", aws_security_group.security_group.*.id)}"
}

resource "aws_security_group_rule" "ingress_cidr_blocks" {
  count             = "${var.enabled == "true" && length(var.allowed_cidr_blocks) > 0 ? 1 : 0}"
  description       = "Allow inbound traffic from CIDR blocks"
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["${var.allowed_cidr_blocks}"]
  security_group_id = "${join("", aws_security_group.security_group.*.id)}"
}

resource "aws_security_group_rule" "egress" {
  count             = "${var.enabled == "true" ? 1 : 0}"
  description       = "Allow all egress traffic"
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${join("", aws_security_group.security_group.*.id)}"
}
