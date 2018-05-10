provider "aws" {
  region = "${var.region}"
}

resource "aws_db_instance" "mysqldb" {
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = "${var.cluster_name}${var.env}database"
  username            = "admin"
  password            = "${var.db_password}"
  skip_final_snapshot = true

  tags {
    key                 = "Name"
    value               = "${var.cluster_name}${var.env}database"
    key                 = "Env"
    value               = "${var.env}"
    propagate_at_launch = true
  }
}
