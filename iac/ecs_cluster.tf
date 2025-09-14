# ECS Cluster
resource "aws_ecs_cluster" "this" {
name = "${var.project_prefix}-ecs-cluster"
}


# Task role and execution role
resource "aws_iam_role" "ecs_task_execution" {
name = "${var.project_prefix}-ecs-task-exec"
assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_role.json
}


data "aws_iam_policy_document" "ecs_task_assume_role" {
statement {
principals {
type = "Service"
identifiers = ["ecs-tasks.amazonaws.com"]
}
actions = ["sts:AssumeRole"]
}
}


resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
role = aws_iam_role.ecs_task_execution.name
policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_ecs_task_definition" "app" {
family = "${var.project_prefix}-task"
cpu = "256"
memory = "512"
network_mode = "awsvpc"
requires_compatibilities = ["FARGATE"]
execution_role_arn = aws_iam_role.ecs_task_execution.arn


container_definitions = jsonencode([
{
name = "app"
image = var.docker_image
essential = true
portMappings = [{ containerPort = 1337, protocol = "tcp" }]
environment = [
{ name = "DEMO_EMAIL", value = "hire-me@anshumat.org" },
{ name = "DEMO_PASSWORD", value = "HireMe@2025!" }
]
logConfiguration = {
logDriver = "awslogs"
options = {
awslogs-group = "/${var.project_prefix}/app"
awslogs-region = var.aws_region
awslogs-stream-prefix = "app"
}
}
}
])
}


resource "aws_ecs_service" "app" {
name = "${var.project_prefix}-service"
cluster = aws_ecs_cluster.this.id
task_definition = aws_ecs_task_definition.app.arn
desired_count = 1
launch_type = "FARGATE"
}

resource "aws_ecr_repository" "app_repo" {
  name = "${var.project_prefix}-app-repo"
}
