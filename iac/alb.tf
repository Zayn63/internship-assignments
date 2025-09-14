resource "aws_lb" "this" {
name = "${var.project_prefix}-alb"
internal = false
load_balancer_type = "application"
subnets = local.use_subnet_ids
}


resource "aws_lb_target_group" "this" {
name = "${var.project_prefix}-tg"
port = 1337
protocol = "HTTP"
vpc_id = local.use_vpc_id
health_check {
path = "/"
matcher = "200-399"
interval = 30
}
}


resource "aws_lb_listener" "http" {
load_balancer_arn = aws_lb.this.arn
port = 80
protocol = "HTTP"
default_action {
type = "forward"
target_group_arn = aws_lb_target_group.this.arn
}
}

resource "aws_lb_target_group_attachment" "app" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = aws_instance.app.id   # or ECS service, depending on what you're attaching
  port             = 80
}
