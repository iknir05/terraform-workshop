# Day 3 · 04 — CI with GitHub Actions

**Story:** ShopFast's last outage was a typo that nobody reviewed. From now on, every pull request gets checked automatically before it can merge.

The workflow is at the repo root: [`.github/workflows/terraform.yml`](../../.github/workflows/terraform.yml). It runs on pull requests that touch `day3/04-ci/` and does:

1. `terraform fmt -check`
2. `terraform init` + `terraform validate`
3. `tflint`
4. `checkov`
5. `terraform plan` — against Floci running as a service container, so no AWS account is needed

## Steps

1. Run the checks locally first:
   ```bash
   cd day3/04-ci
   terraform init && terraform fmt -check && terraform validate && tflint && checkov -d .
   ```
2. Use this template to create your own repo, then open a pull request:
   ```bash
   git checkout -b ci-test
   # e.g. add a tag to the bucket in main.tf
   git commit -am "Add a tag" && git push -u origin ci-test
   gh pr create --fill
   ```
3. Watch the **Actions** tab (or `gh pr checks --watch`).
4. **Break it on purpose:** push a badly indented line and watch `fmt -check` fail the PR. Fix it and push again.
