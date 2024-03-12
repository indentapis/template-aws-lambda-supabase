terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + Supabase Integration

# Details: https://github.com/indentapis/integrations/tree/c8a55bd96a26a7dca15688defd2db8c41d3cc425/packages/beta/indent-integration-supabase
# Last Change: https://github.com/indentapis/integrations/commit/c8a55bd96a26a7dca15688defd2db8c41d3cc425

module "idt-supabase-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-supabase-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/supabase-c8a55bd96a26a7dca15688defd2db8c41d3cc425-function.zip"
    deps_key     = "webhooks/aws/lambda/supabase-c8a55bd96a26a7dca15688defd2db8c41d3cc425-deps.zip"
  }
  env = {
    SUPABASE_TOKEN  = var.supabase_token
    SUPABASE_ORG_ID = var.supabase_org_id
  }
}

