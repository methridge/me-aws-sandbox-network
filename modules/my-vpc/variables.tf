variable "admin_ip" {
  description = "Your public IP for direct access"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "region" {
  description = "AWS Primary region for provider"
  type        = string
}

variable "region_cidr" {
  description = "CIDR for vpc"
  type        = string
}

variable "username" {
  description = "User name for access and to prefix all resources"
  type        = string
}
