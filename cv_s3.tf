# Configure the AWS Provider
provider "aws" {
  region  = "ca-central-1"
  profile = "default"
}

terraform {
  backend "s3" {
    bucket = "pn-tf-state"
    key    = "cvpn"
    region = "ca-central-1"
  }
}

# TODO: For CI: An IAM role/policy to upload to S3 by CI

resource "aws_s3_bucket" "cvpn" {
  # Bucket name must match the DNS it will be CNAME'd from
  # https://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html
  bucket = "cv.pierre-nick.com"
  acl    = "public-read"

  website {
      index_document = "cv.pdf"
  }
}

resource "aws_s3_bucket_policy" "cvpn_policy" {
  bucket = "${aws_s3_bucket.cvpn.id}"
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.cvpn.bucket}/*"
    }
  ]
}
POLICY
}

output "Domain to CNAME" {
  value = "${aws_s3_bucket.cvpn.website_endpoint}"
}
