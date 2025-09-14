resource "aws_db_instance" "default" {
allocated_storage = 20
engine = "postgres"
engine_version = "14"
instance_class = "db.t3.micro"
name = "demo_db"
username = "demo_admin"
password = "ChangeMe123!"
identifier = var.db_identifier
skip_final_snapshot = true
publicly_accessible = false
vpc_security_group_ids = []
db_subnet_group_name = aws_db_subnet_group.default.name
}


resource "aws_db_subnet_group" "default" {
name = "${var.project_prefix}-db-subnet"
subnet_ids = local.use_subnet_ids
}