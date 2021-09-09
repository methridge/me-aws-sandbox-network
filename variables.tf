variable "admin_ip" {
  description = "Your public IP for direct access"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region_map" {
  description = "Object Map of Regions (key) with CIDR block IP range item."
  type = map(
    object({
      region_cidr     = string
      private_subnets = list(string)
      public_subnets  = list(string)
    })
  )
}

variable "username" {
  description = "User name for access and to prefix all resources"
  type        = string
}
