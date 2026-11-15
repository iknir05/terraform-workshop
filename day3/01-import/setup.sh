#!/usr/bin/env bash
# Creates a bucket "by hand" (outside Terraform), like the marketing team did.
set -euo pipefail

aws s3 mb s3://shopfast-marketing
echo "Black Friday campaign assets" > campaign.txt
aws s3 cp campaign.txt s3://shopfast-marketing/campaign.txt
rm campaign.txt

echo "Created s3://shopfast-marketing (not managed by Terraform yet)"
aws s3 ls s3://shopfast-marketing
