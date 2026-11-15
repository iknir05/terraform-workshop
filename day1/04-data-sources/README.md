# Day 1 · 04 — Data sources

**Story:** ShopFast's log bucket must have a globally unique name. Instead of guessing, build it from the region and account ID that AWS reports.

## Steps

1. **Read account and region.** `terraform init && terraform apply`. The bucket name is built from `data.aws_region` and `data.aws_caller_identity` (Floci's account ID is `000000000000`).
   ```bash
   terraform output bucket_name
   ```
2. **Read an object.** Uncomment the `STEP 2` block. It uploads `config.txt` and reads it back with the `aws_s3_object` data source. Apply, then:
   ```bash
   terraform output config_content
   ```
3. **Clean up.** `terraform destroy`

> Resources **create** things. Data sources only **read** things that already exist.
