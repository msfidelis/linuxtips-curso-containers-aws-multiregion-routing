output "global_accelerator_dns" {
  value = aws_globalaccelerator_accelerator.main.dns_name
}

output "global_accelerator_ips" {
  value = aws_globalaccelerator_accelerator.main.ip_sets
}