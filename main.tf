provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

module "vpc-us-east-1" {
  source = "./modules/my-vpc"
  providers = {
    aws = aws.us-east-1
  }

  admin_ip        = var.admin_ip
  environment     = var.environment
  private_subnets = var.region_map["us-east-1"].private_subnets
  public_subnets  = var.region_map["us-east-1"].public_subnets
  region          = "us-east-1"
  region_cidr     = var.region_map["us-east-1"].region_cidr
  username        = var.username
}

module "vpc-us-east-2" {
  source = "./modules/my-vpc"
  providers = {
    aws = aws.us-east-2
  }

  admin_ip        = var.admin_ip
  environment     = var.environment
  private_subnets = var.region_map["us-east-2"].private_subnets
  public_subnets  = var.region_map["us-east-2"].public_subnets
  region          = "us-east-2"
  region_cidr     = var.region_map["us-east-2"].region_cidr
  username        = var.username
}

module "vpc-us-west-2" {
  source = "./modules/my-vpc"
  providers = {
    aws = aws.us-west-2
  }

  admin_ip        = var.admin_ip
  environment     = var.environment
  private_subnets = var.region_map["us-west-2"].private_subnets
  public_subnets  = var.region_map["us-west-2"].public_subnets
  region          = "us-west-2"
  region_cidr     = var.region_map["us-west-2"].region_cidr
  username        = var.username
}
