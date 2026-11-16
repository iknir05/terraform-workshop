# One bucket per product category, using count.
variable "categories" {
  type    = list(string)
  default = ["electronics", "toys", "books"]
}

resource "aws_s3_bucket" "category" {
  count  = length(var.categories)
  bucket = "shopfast-${var.categories[count.index]}"
}
