
resource "aws_db_instance" "this" {
  identifier         = var.db_identifier
  instance_class     = var.instance_class
  allocated_storage  = var.allocated_storage
  engine             = var.engine
  username           = var.username
  password           = var.password
  skip_final_snapshot = true
}
