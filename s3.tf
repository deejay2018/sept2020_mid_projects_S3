provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_s3_bucket" "website" {
  bucket = var.website_bucket_name
  acl    = "public-read"
  policy = file("policy.json")
  force_destroy = var.s3_force_destroy

  tags = {
    "Name" = var.website_bucket_name
  }


  website {
    index_document = "index.html"
  }

}

# Refactor it to use loop
resource "aws_s3_bucket_object" "index" {
  bucket       = var.website_bucket_name
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}