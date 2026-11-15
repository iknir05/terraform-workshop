# Day 2 · 06 — Drift

**Story:** 2 a.m. Checkout is down. An on-call engineer "fixes" it by clicking around in the console: they retag the bucket and delete a file they think is broken. The outage ends... but now reality no longer matches the code. That's **drift**.

## Steps

1. **Apply.** `terraform init && terraform apply`.
2. **Cause the drift (play the on-call engineer).** In the Floci UI:
   - open `shopfast-checkout-assets` and change the `CostCenter` tag to `hotfix`
   - delete `banner.txt`
3. **Detect it.**
   ```bash
   terraform plan                      # tag update (~) and object create (+)
   terraform plan -refresh-only        # just report what changed outside Terraform
   ```
4. **Fix it.** `terraform apply` — the code wins and reality is put back.
   (If the console change was actually correct, you'd update the code instead.)
5. **Clean up.** `terraform destroy`
