variable "aws_region" {
type = string
default = "eu-north-1"
}


variable "project_prefix" {
type = string
default = "z"
}


variable "vpc_id" {
type = string
default = ""
description = "Optional: provide existing VPC ID to deploy into. Leave empty to create a new VPC."
}


variable "subnet_ids" {
type = list(string)
default = []
}


variable "db_identifier" {
type = string
default = "z-demo-db"
}


variable "docker_image" {
type = string
default = "zayn63/strapi-task10:latest"
}
