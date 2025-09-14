provider "aws" {
region = var.aws_region
# credentials should be provided by evaluator or CI via environment / profile
}