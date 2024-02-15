variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "indent_webhook_secret" {
  type      = string
  sensitive = true
}

variable "supabase_token" {
  type      = string
  default   = ""
  sensitive = true
}

variable "supabase_org_id" {
  type      = string
  default   = ""
  sensitive = true
}

