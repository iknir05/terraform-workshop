# Day 3 · 03 — Code quality and security

**Story:** ShopFast is about to store customer data, and an auditor is coming. The current code works — but it's messy, has lint issues, and the bucket is wide open.

## Steps

1. **Format and validate.**
   ```bash
   terraform init
   terraform fmt -check -diff     # shows what's wrong, exit code 3
   terraform fmt                  # fixes it
   terraform validate
   ```
2. **Lint.**
   ```bash
   tflint --init
   tflint
   ```
   It reports an unused, untyped variable (`owner`) and a deprecated `"${...}"` interpolation. Fix both as the `STEP 2` comments say, then rerun `tflint` until it's clean.
3. **Security scan.**
   ```bash
   checkov -d .
   ```
   Note the failures: no public access block, no encryption, no versioning. Uncomment the `STEP 3` block and run `checkov -d .` again — those checks now pass.

   Some checks (access logging, cross-region replication, KMS, event notifications, lifecycle) still fail. In a real project you'd fix them or skip them with a reason:
   ```hcl
   resource "aws_s3_bucket" "customer_data" {
     #checkov:skip=CKV_AWS_144:Single-region workshop
     ...
   }
   ```
4. **Apply and clean up.** `terraform apply`, then `terraform destroy`.
