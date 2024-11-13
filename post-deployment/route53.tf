resource "aws_route53_record" "main" {
  zone_id = var.route53_hosted_zone
  name    = var.dns_name

  type = "CNAME"

  ttl = 10

  weighted_routing_policy {
    weight = 100
  }

  set_identifier = var.project_name

  records = [
    aws_globalaccelerator_accelerator.main.dns_name
  ]
}