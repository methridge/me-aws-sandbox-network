output "vpc_map" {
  description = "VPC output object map"
  value = {
    "us-east-1" = {
      vpc_id          = module.vpc-us-east-1.vpc_id
      vpc_cidr_block  = module.vpc-us-east-1.vpc_cidr_block
      private_subnets = module.vpc-us-east-1.private_subnets
      public_subnets  = module.vpc-us-east-1.public_subnets
      nat_public_ips  = module.vpc-us-east-1.nat_public_ips
      azs             = module.vpc-us-east-1.azs
    }
    "us-east-2" = {
      vpc_id          = module.vpc-us-east-2.vpc_id
      vpc_cidr_block  = module.vpc-us-east-2.vpc_cidr_block
      private_subnets = module.vpc-us-east-2.private_subnets
      public_subnets  = module.vpc-us-east-2.public_subnets
      nat_public_ips  = module.vpc-us-east-2.nat_public_ips
      azs             = module.vpc-us-east-2.azs
    }
    "us-west-2" = {
      vpc_id          = module.vpc-us-west-2.vpc_id
      vpc_cidr_block  = module.vpc-us-west-2.vpc_cidr_block
      private_subnets = module.vpc-us-west-2.private_subnets
      public_subnets  = module.vpc-us-west-2.public_subnets
      nat_public_ips  = module.vpc-us-west-2.nat_public_ips
      azs             = module.vpc-us-west-2.azs
    }
  }
}
