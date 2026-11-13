output "treasury_financial_accounts_id" {
  description = "Map of id values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.id }
}
output "treasury_financial_accounts_active_features" {
  description = "Map of active_features values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.active_features }
}
output "treasury_financial_accounts_balance" {
  description = "Map of balance values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.balance }
}
output "treasury_financial_accounts_country" {
  description = "Map of country values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.country }
}
output "treasury_financial_accounts_created" {
  description = "Map of created values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.created }
}
output "treasury_financial_accounts_financial_addresses" {
  description = "Map of financial_addresses values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.financial_addresses }
}
output "treasury_financial_accounts_is_default" {
  description = "Map of is_default values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.is_default }
}
output "treasury_financial_accounts_livemode" {
  description = "Map of livemode values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.livemode }
}
output "treasury_financial_accounts_metadata" {
  description = "Map of metadata values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.metadata }
}
output "treasury_financial_accounts_nickname" {
  description = "Map of nickname values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.nickname }
}
output "treasury_financial_accounts_object" {
  description = "Map of object values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.object }
}
output "treasury_financial_accounts_pending_features" {
  description = "Map of pending_features values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.pending_features }
}
output "treasury_financial_accounts_platform_restrictions" {
  description = "Map of platform_restrictions values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.platform_restrictions }
}
output "treasury_financial_accounts_restricted_features" {
  description = "Map of restricted_features values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.restricted_features }
}
output "treasury_financial_accounts_status" {
  description = "Map of status values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.status }
}
output "treasury_financial_accounts_status_details" {
  description = "Map of status_details values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.status_details }
}
output "treasury_financial_accounts_supported_currencies" {
  description = "Map of supported_currencies values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.supported_currencies }
}

