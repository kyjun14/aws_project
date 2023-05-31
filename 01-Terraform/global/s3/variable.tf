variable "bucket_name" {
  type    = string
  default = "aws13-terraform-state"
}

variable "table_name" {
  type    = string
  default = "aws13-terraform-locks"
}
