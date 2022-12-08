resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 8
  tags = {
    git_commit           = "c428ffb1677851e8a8841ea03e3b9a0e08dbba0a"
    git_file             = "terraform/aws/kms.tf"
    git_last_modified_at = "2022-12-08 14:39:11"
    git_last_modified_by = "112870361+rishav-19@users.noreply.github.com"
    git_modifiers        = "112870361+rishav-19/nimrodkor"
    git_org              = "rishav-19"
    git_repo             = "terragoat"
    yor_trace            = "cd8fa2a7-4868-4cd1-993d-da4644808ce5"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
