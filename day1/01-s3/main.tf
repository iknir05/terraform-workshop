# ShopFast's first bucket, for product images.
resource "aws_s3_bucket" "product_images" {
  bucket = "shopfast-product-images"

  tags = {
    Project     = "ShopFast"
    Environment = "dev"
    Team        = "catalog"
  }
}
