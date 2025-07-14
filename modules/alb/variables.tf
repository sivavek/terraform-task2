
variable "name" {}
variable "internal" {
  type    = bool
  default = false
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
