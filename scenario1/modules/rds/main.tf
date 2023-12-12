variable "instance_name" {}

resource "aws_db_instance" "db_proj" {
  identifier           = var.instance_name
  engine               = "mysql" 
  instance_class       = "db.t2.micro"
  allocated_storage    = 20
  master_username      = "admin"
  master_password      = random_password.password.result
  backup_retention_period = 7
  apply_immediately    = true

  vpc_security_group_ids = [aws_security_group.db_sg.id]

  deletion_protection = true

  auto_minor_version_upgrade = true

  skip_final_snapshot = true

  publicly_accessible = false 
  tags = {
    Name = var.instance_name
  }
}

resource "random_password" "password" {
  length  = 16
  special = true
  upper   = true
  lower   = true
  number  = true
}

resource "aws_security_group" "db_sg" {
}

output "rds_instance_endpoint" {
  value = aws_db_instance.db_proj.endpoint
}
