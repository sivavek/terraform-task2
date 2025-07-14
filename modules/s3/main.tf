
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  }
  
  resource "aws_s3_bucket_versioning" "this" {
    bucket = aws_s3_bucket.this.id
    versioning_configuration {
      status = var.versioning ? "Enabled" : "Suspended"
    }

  # Use bucket policy or grant block for access control instead of deprecated 'acl'
}
