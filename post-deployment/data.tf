data "aws_ssm_parameter" "primary" {
  name = var.nlb_arn_primary_ssm
}

data "aws_ssm_parameter" "secondary" {
  provider = aws.secondary
  name     = var.nlb_arn_secondary_ssm
}