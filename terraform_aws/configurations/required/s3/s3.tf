resource "aws_s3_bucket" "s3" {
  bucket = var.s3_bucket_name

  tags = var.s3_name_tag
}