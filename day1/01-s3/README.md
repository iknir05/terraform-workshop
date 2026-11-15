# Day 1 · 01 — Your first S3 bucket

**Story:** ShopFast is a two-person startup selling gadgets online. They need somewhere to store product images, and they want it written as code from day one.

## Steps

1. **Create the bucket.** `main.tf` already has the bucket. Run `terraform init`, `terraform plan`, `terraform apply`. Find the bucket in the Floci UI.
2. **Upload a file.** Uncomment the `STEP 2` block (`hello.txt`), then plan and apply. Notice only one resource is added.
3. **Change a tag.** Change `Environment` from `"dev"` to `"staging"`. Plan shows `~` — an in-place update.
4. **Rename the bucket.** Change the bucket name to `"shopfast-product-images-v2"`. Plan shows `-/+` — *forces replacement*. The object is replaced too, because it depends on the bucket.

## Commands

```bash
cd day1/01-s3
terraform init
terraform plan
terraform apply
aws s3 ls                                  # the AWS CLI talks to Floci too
aws s3 ls s3://shopfast-product-images
terraform destroy
```
