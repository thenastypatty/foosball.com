resource "aws_db_instance" "foosballhq-database" {
  engine = "mysql"
  allocated_storage = "${var.allocated_storage}"
  instance_class = "${var.instance_class}"
  name = "${var.db_name}"
  username = "${var.db_admin_username}"
  password = "${var.db_admin_password}"
  final_snapshot_identifier = "${var.final_snapshot_identifier}"
}
