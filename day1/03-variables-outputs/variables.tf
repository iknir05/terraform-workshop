variable "bucket_prefix" {
  description = "Prefix for every bucket name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (test, dev, prod)"
  type        = string
  default     = "test"
}

variable "tags" {
  description = "Tags applied to every resource"
  type        = map(string)
  default     = {}
}
