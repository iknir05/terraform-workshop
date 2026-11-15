# Day 2 · 01 — count and for_each

**Story:** ShopFast now sells electronics, toys and books. Each category gets its own bucket — and soon, the business needs database tables too.

## Steps

1. **count.** `terraform init && terraform apply` — three buckets from a list.
2. **The count trap.** Remove `"toys"` from the list and run `terraform plan`. Look closely: Terraform wants to replace `category[1]` (it's now `books`) and destroy `category[2]`. Indexes shift!
3. **Switch to for_each.** Run `terraform destroy`, comment out the `count` resource, and uncomment the `for_each` block. Apply, then `terraform state list` — resources are now keyed by name: `aws_s3_bucket.category_set["toys"]`.
4. **Remove the middle item again.** Remove `"toys"` from the set and plan. Only `["toys"]` is destroyed. Apply.
5. **for_each over a map.** Uncomment the `STEP 5` block: DynamoDB tables `orders` and `customers`. Apply, then `aws dynamodb list-tables`.
6. **Clean up.** `terraform destroy`

> Rule of thumb: `count` for "N identical things" or on/off switches; `for_each` for anything with a name.
