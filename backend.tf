
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-14072025"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-locks-table"
    # encrypt        = true
  }
}
