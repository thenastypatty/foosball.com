provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "foosballhq-nonprod"
    key    = "staging/db/mysql/foosballhq_nonprod.tfstate"
    region = "us-east-1"
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
  name   = "default"
}


module "db" {
  source = "terraform-aws-modules/rds/aws"
  identifier = "demodb"
  engine = "mysql"
  engine_version = "5.7.19"
  family = "mysql5.7"
  major_engine_version = "5.7"
  instance_class = "${var.aws_instance_class}"
  allocated_storage = "${var.allocated_storage}"
  storage_encrypted = false
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  name = "${var.db_name}"
  username = "${var.db_admin_username}"
  password = "${var.db_admin_password}!"
  port = "${var.db_connection_port}"

  vpc_security_group_ids = ["${data.aws_security_group.default.id}"]
  backup_retention_period = 1
  tags = {
    Environment = "staging"
  }
  enabled_cloudwatch_logs_exports = ["error", "general"]
  subnet_ids = ["${data.aws_subnet_ids.all.ids}"]
  final_snapshot_identifier = "${var.final_snapshot_identifier}"
  deletion_protection = true
  options = []
}
