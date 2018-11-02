variable "allocated_storage" {
    default = 10
    description = "How many gigabites of memory to give RDS instance"
}
variable "aws_instance_class" {
    default = "db.t2.micro"
    description = "AWS instance class"
}

variable "db_identifier" {
    default = "foosball.com"
    description = "Default AWS Console identifier for database (instead of randomly generated)"
}

variable "db_name" {
    default = "foosballhq_staging"
    description = "Default name of database"
}
variable "db_admin_username" {
    default = "admin"
    description = "DB admin username"
}

variable "db_connection_port" {
    default = 3306
    description = "Default port on which DB accepts connections"
}

variable "db_admin_password" {
    description = "DB admin password"
}
variable "final_snapshot_identifier" {
    default = "staging-final-snapshot"
}