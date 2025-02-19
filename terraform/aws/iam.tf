resource "aws_iam_user" "user" {
  name          = "${local.resource_prefix.value}-user"
  force_destroy = false

  tags = merge({
    Name        = "${local.resource_prefix.value}-user"
    Environment = local.resource_prefix.value
    }, {
    git_commit           = "c55d926b0db6a69cad17ceed06672da5d47dccc8"
    git_file             = "terraform/aws/iam.tf"
    git_last_modified_at = "2022-12-08 16:04:48"
    git_last_modified_by = "112870361+rishav-19@users.noreply.github.com"
    git_modifiers        = "112870361+rishav-19/nimrodkor"
    git_org              = "rishav-19"
    git_repo             = "terragoat"
    yor_trace            = "9b45b298-c1ea-426a-9644-610780021eaa"
  })

}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "userpolicy" {
  name = "excess_policy"
  user = "${aws_iam_user.user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "s3:*",
        "lambda:*",
        "cloudwatch:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "username" {
  value = aws_iam_user.user.name
}

output "secret" {
  value = aws_iam_access_key.user.encrypted_secret
}

