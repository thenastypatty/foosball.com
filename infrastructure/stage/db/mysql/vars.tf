variable "allocated_storage" {
    default = 10
    description = "How many gigabites of memory to give RDS instance"
}
variable "instance_class" {
    default = "db.t2.micro"
    description = "AWS instance class"
}
variable "db_name" {
    default = "foosballhq_staging"
}
variable "db_admin_username" {
    default = "admin"
    description = "DB admin username"
}
variable "db_admin_password" {
    description = "DB admin password"
}
variable "final_snapshot_identifier" {
    default = "staging-final-snapshot"
}