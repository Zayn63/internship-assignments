output "alb_dns_name" {
value = aws_lb.this.dns_name
}


output "ecs_cluster" {
value = aws_ecs_cluster.this.id
}


output "rds_endpoint" {
value = aws_db_instance.default.address
}

output "ecr_repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.app_repo.repository_url
}
