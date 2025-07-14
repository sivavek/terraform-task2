
variable "bucket_name" {}
variable "versioning" {
  type    = bool
  default = false
}
variable "public_access" {
  type    = bool
  default = false
}
