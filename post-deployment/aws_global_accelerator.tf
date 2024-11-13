resource "aws_globalaccelerator_accelerator" "main" {
  name            = var.project_name
  ip_address_type = "IPV4"

  enabled = true
}

resource "aws_globalaccelerator_listener" "main" {
  accelerator_arn = aws_globalaccelerator_accelerator.main.id
  client_affinity = "NONE"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }


  port_range {
    from_port = 443
    to_port   = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "primary" {
  listener_arn          = aws_globalaccelerator_listener.main.id
  endpoint_group_region = var.region_primary
  endpoint_configuration {
    endpoint_id                    = data.aws_ssm_parameter.primary.value
    client_ip_preservation_enabled = true
    weight                         = lookup(var.routing, "primary")
  }
}

resource "aws_globalaccelerator_endpoint_group" "secondary" {
  listener_arn          = aws_globalaccelerator_listener.main.id
  endpoint_group_region = var.region_secondary
  endpoint_configuration {
    endpoint_id                    = data.aws_ssm_parameter.secondary.value
    client_ip_preservation_enabled = true
    weight                         = lookup(var.routing, "secondary")
  }
}