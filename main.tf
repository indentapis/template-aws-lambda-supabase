terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + Supabase Integration

# Details: https://github.com/indentapis/integrations/tree/91c3366bcc4fa14c768d08cb9b3f39cda3ddae3b/packages/beta/indent-integration-supabase
# Last Change: https://github.com/indentapis/integrations/commit/91c3366bcc4fa14c768d08cb9b3f39cda3ddae3b

module "idt-supabase-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-supabase-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/supabase-91c3366bcc4fa14c768d08cb9b3f39cda3ddae3b-function.zip"
    deps_key     = "webhooks/aws/lambda/supabase-91c3366bcc4fa14c768d08cb9b3f39cda3ddae3b-deps.zip"
  }
  env = {
    SUPABASE_TOKEN  = var.supabase_token
    SUPABASE_ORG_ID = var.supabase_org_id
  }
}

