variable "admin_email_list" {
  type        = list(string)
  description = "List of Admin user email addresses."
  default     = ["andrew.stephens@insight.com", "david.jensen@insight.com"]
}
