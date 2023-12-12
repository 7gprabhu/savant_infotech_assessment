resource "aws_db_instance" "project_alpha" {
  identifier            = "db_proj_alpha"
  instance_class        = "db.t2.micro"
  engine                = "mysql"
  username              = "admin"
  password              = random_password.project_alpha.result
  allocated_storage     = 20
  backup_retention_days = 7
  delete_protection     = true
  publicly_accessible   = false
  apply_immediately     = true
}

resource "aws_db_instance" "project_beta" {
  identifier            = "db_proj_beta"
  instance_class        = "db.t2.micro"
  engine                = "mysql"
  username              = "admin"
  password              = random_password.project_beta.result
  allocated_storage     = 20
  backup_retention_days = 7
  delete_protection     = true
  publicly_accessible   = false
  apply_immediately     = true
}
