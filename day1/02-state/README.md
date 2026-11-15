# Day 1 · 02 — State

**Story:** A new developer joins ShopFast and asks: "How does Terraform know what it already created?" The answer is the state file.

## Steps

1. **Apply.** `terraform init` and `terraform apply`. A `terraform.tfstate` file appears — open it and look around (it's JSON).
2. **Inspect the state.**
   ```bash
   terraform state list
   terraform state show aws_s3_bucket.orders_export
   terraform state show aws_s3_object.readme
   ```
3. **Delete something behind Terraform's back.** In the Floci UI, open the `shopfast-orders-export` bucket and delete `README.txt`. Then run:
   ```bash
   terraform plan
   ```
   Terraform refreshes state against the real world, sees the object is gone, and plans to create it again. Run `terraform apply` to fix it.
4. **Clean up.** `terraform destroy`

> State is Terraform's memory. Never edit it by hand — use `terraform state` commands.
