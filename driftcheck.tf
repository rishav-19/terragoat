provider "aws"{
    access_key = "AKIA6FVCVEBLGIQ23VM6"
    secret_key = "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"
    region = "us-east-1"
}
resource "aws_s3_bucket" "drift-check-bucket"{

  tags = {
    Name = "S3Bucket"
  }
  
    versioning {
        enabled    = true
        mfa_delete = true
    }

}