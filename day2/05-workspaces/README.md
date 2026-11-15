# Day 2 · 05 — Workspaces

**Story:** ShopFast wants identical dev and prod copies of the website bucket from the same code, each with its own state.

## Steps

1. **Default workspace.** `terraform init && terraform apply` → `shopfast-default-site`.
2. **Create dev and prod.**
   ```bash
   terraform workspace new dev
   terraform apply                # shopfast-dev-site
   terraform workspace new prod
   terraform apply                # shopfast-prod-site
   ```
3. **Switch and list.**
   ```bash
   terraform workspace list       # * marks the current one
   terraform workspace select dev
   terraform workspace show
   ls terraform.tfstate.d/        # one state per workspace
   ```
4. **Clean up — every workspace.**
   ```bash
   for ws in prod dev default; do terraform workspace select $ws && terraform destroy -auto-approve; done
   terraform workspace delete dev
   terraform workspace delete prod
   ```
