variable "project_name" {}

variable "region_primary" {}

variable "region_secondary" {}

variable "nlb_arn_primary_ssm" {}

variable "nlb_arn_secondary_ssm" {}

variable "routing" {
  type = object({
    primary   = number
    secondary = number
  })
}

variable "route53_hosted_zone" {}

variable "dns_name" {}