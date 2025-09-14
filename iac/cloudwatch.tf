resource "aws_cloudwatch_log_group" "app" {
name = "/${var.project_prefix}/app"
retention_in_days = 14
}


resource "aws_cloudwatch_metric_alarm" "cpu_high" {
alarm_name = "${var.project_prefix}-ecs-cpu-high"
comparison_operator = "GreaterThanThreshold"
evaluation_periods = 2
metric_name = "CPUUtilization"
namespace = "AWS/ECS"
period = 300
statistic = "Average"
threshold = 80
}