
variable "s3_force_destroy" {
  type        = string
  description = "Destroy the s3 bucket inspite of contents in it."
  default     = "false"
}
variable "website_bucket_name" {
  default     = "s3-website-test-deejay.com"
}