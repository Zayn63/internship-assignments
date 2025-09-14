# Minimal new VPC (created only if vpc_id not provided)
resource "aws_vpc" "this" {
count = var.vpc_id == "" ? 1 : 0
cidr_block = "10.0.0.0/16"
tags = { Name = "${var.project_prefix}-vpc" }
}


resource "aws_subnet" "this" {
count = var.vpc_id == "" ? 2 : 0
vpc_id = aws_vpc.this[0].id
cidr_block = cidrsubnet(aws_vpc.this[0].cidr_block, 8, count.index)
availability_zone = data.aws_availability_zones.available.names[count.index]
tags = { Name = "${var.project_prefix}-subnet-${count.index}" }
}


data "aws_availability_zones" "available" {}


# local value to decide which VPC/subnets to use
locals {
use_vpc_id = var.vpc_id != "" ? var.vpc_id : (aws_vpc.this[0].id)
use_subnet_ids = length(var.subnet_ids) > 0 ? var.subnet_ids : aws_subnet.this[*].id
}