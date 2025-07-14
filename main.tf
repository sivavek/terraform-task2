
provider "aws" {
  region = "us-east-1"
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}

# Get default security group
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

# Get public subnets in the default VPC
data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "rds" {
  source            = "./modules/rds"
  db_identifier     = "mydb"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  engine            = "mysql"
  username          = "admin"
  password          = "admin12345"
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-1234567890abcdef0"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnets.default_vpc_subnets.ids[0]
  name          = "my-ec2"
  depends_on    = [module.rds]
}

module "s3" {
  source        = "./modules/s3"
  bucket_name   = "my-terraform-bucket"
  versioning    = true
  public_access = false
}

module "alb" {
  source             = "./modules/alb"
  name               = "my-alb"
  internal           = false
  subnet_ids         = data.aws_subnets.default_vpc_subnets.ids
  security_group_ids = [data.aws_security_group.default.id]
}
