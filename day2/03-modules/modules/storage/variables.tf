variable "name" {
  description = "Bucket name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "tags" {
  description = "Extra tags for the bucket"
  type        = map(string)
  default     = {}
}
