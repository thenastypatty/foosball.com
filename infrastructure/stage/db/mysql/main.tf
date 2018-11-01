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

module "mysql_db" {
  source = "../../../modules/mysql_db"
  allocated_storage = "${var.allocated_storage}"
  instance_class = "${var.instance_class}"
  db_name = "${var.db_name}"
  db_admin_username = "${var.db_admin_username}"
  db_admin_password = "${var.db_admin_password}"
  final_snapshot_identifier = "${var.final_snapshot_identifier}"
}
