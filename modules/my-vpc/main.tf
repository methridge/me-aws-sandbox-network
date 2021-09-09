locals {
  network_acls = {
    default_inbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = var.admin_ip
      },
    ]
    default_outbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
      },
    ]
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.username}-sandbox-subnet-${var.region}"
  cidr = var.region_cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = local.network_acls["default_inbound"]
  public_outbound_acl_rules    = local.network_acls["default_outbound"]

  private_dedicated_network_acl = false

  manage_default_network_acl = true

  manage_default_route_table = true
  default_route_table_tags   = { DefaultRouteTable = true }

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  # enable_dhcp_options              = true
  # dhcp_options_domain_name         = "service.consul"
  # dhcp_options_domain_name_servers = ["127.0.0.1", "10.10.0.2"]

  # Default security group - ingress/egress rules cleared to deny all
  # manage_default_security_group  = true
  # default_security_group_ingress = []
  # default_security_group_egress  = []

  tags = {
    Username    = var.username
    Environment = var.environment
  }
}
