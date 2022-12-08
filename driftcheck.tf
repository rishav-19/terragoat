provider "aws" {
  access_key = "AKIA6FVCVEBLGIQ23VM6"
  secret_key = "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"
  region     = "us-east-1"
}
resource "aws_s3_bucket" "drift-check-bucket" {

  tags = {
    Name                 = "S3Bucket"
    git_commit           = "63903242ae8f19add944f5b3e1cd2bec0f2c7d93"
    git_file             = "driftcheck.tf"
    git_last_modified_at = "2022-12-08 08:22:24"
    git_last_modified_by = "112870361+rishav-19@users.noreply.github.com"
    git_modifiers        = "112870361+rishav-19"
    git_org              = "rishav-19"
    git_repo             = "terragoat"
    yor_trace            = "1e3090f3-2f8b-4a19-81b1-bea0145e106d"
  }

  versioning {
    enabled    = true
    mfa_delete = true
  }

}