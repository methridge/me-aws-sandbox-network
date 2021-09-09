# Terraform module to create AWS sandbox network

This module creates a AWS network and multiple subnets for use as a testing
sandbox. Regions and their subnets are specified in an object map.

## Limitations

Due to limitations in how the AWS provider works, specifically around having to
define the region at the provider level, I have hard coded the 3 regions into
the `main.tf` and `outputs.tf` files.

I do not like this, and would love input on a better way to make this work.

## Deploying

- Create `terraform.tfvars` file

  ```hcl
  admin-ip    = ["200.200.100.100/32"]
  environment = "sandbox"
  username    = "awesomeuser"
  region-map = {
    "us-east-1" = {
      "region_cidr"     = "20.13.0.0/20"
      "public_subnets"  = ["20.13.0.0/24", "20.13.1.0/24", "20.13.2.0/24"]
      "private_subnets" = ["20.13.8.0/24", "20.13.9.0/24", "20.13.10.0/24"]
    }
    "us-east-2" = {
      "region_cidr"     = "20.13.16.0/20"
      "public_subnets"  = ["20.13.16.0/24", "20.13.17.0/24", "20.13.18.0/24"]
      "private_subnets" = ["20.13.24.0/24", "20.13.25.0/24", "20.13.26.0/24"]
    }
    "us-west-2" = {
      "region_cidr"     = "20.13.48.0/20"
      "public_subnets"  = ["20.13.48.0/24", "20.13.49.0/24", "20.13.50.0/24"]
      "private_subnets" = ["20.13.56.0/24", "20.13.57.0/24", "20.13.58.0/24"]
    }
  }
  ```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| vpc-us-east-1 | ./modules/my-vpc | n/a |
| vpc-us-east-2 | ./modules/my-vpc | n/a |
| vpc-us-west-2 | ./modules/my-vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_ip | Your public IP for direct access | `string` | n/a | yes |
| environment | Environment name | `string` | n/a | yes |
| region\_map | Object Map of Regions (key) with CIDR block IP range item. | <pre>map(<br>    object({<br>      region_cidr     = string<br>      private_subnets = list(string)<br>      public_subnets  = list(string)<br>    })<br>  )</pre> | n/a | yes |
| username | User name for access and to prefix all resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_map | VPC output object map |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
