output "idt-supabase-webhook-url" {
  value       = module.idt-supabase-webhook.function_url
  description = "The URL of the deployed Lambda"
}

