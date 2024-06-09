resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "this" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = var.tags
}
