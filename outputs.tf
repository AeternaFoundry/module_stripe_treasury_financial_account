output "treasury_financial_accounts_id" {
  description = "Map of id values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no id are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "treasury_financial_accounts_active_features" {
  description = "Map of active_features values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no active_features are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.active_features if v.active_features != null && length(v.active_features) > 0 }
}
output "treasury_financial_accounts_balance" {
  description = "Map of balance values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no balance are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.balance if v.balance != null && length(v.balance) > 0 }
}
output "treasury_financial_accounts_country" {
  description = "Map of country values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no country are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.country if v.country != null && length(v.country) > 0 }
}
output "treasury_financial_accounts_created" {
  description = "Map of created values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no created are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.created if v.created != null }
}
output "treasury_financial_accounts_financial_addresses" {
  description = "Map of financial_addresses values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no financial_addresses are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.financial_addresses if v.financial_addresses != null && length(v.financial_addresses) > 0 }
}
output "treasury_financial_accounts_is_default" {
  description = "Map of is_default values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no is_default are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.is_default if v.is_default != null }
}
output "treasury_financial_accounts_livemode" {
  description = "Map of livemode values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no livemode are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.livemode if v.livemode != null }
}
output "treasury_financial_accounts_metadata" {
  description = "Map of metadata values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no metadata are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "treasury_financial_accounts_nickname" {
  description = "Map of nickname values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no nickname are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.nickname if v.nickname != null && length(v.nickname) > 0 }
}
output "treasury_financial_accounts_object" {
  description = "Map of object values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no object are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.object if v.object != null && length(v.object) > 0 }
}
output "treasury_financial_accounts_pending_features" {
  description = "Map of pending_features values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no pending_features are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.pending_features if v.pending_features != null && length(v.pending_features) > 0 }
}
output "treasury_financial_accounts_platform_restrictions" {
  description = "Map of platform_restrictions values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no platform_restrictions are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.platform_restrictions if v.platform_restrictions != null && length(v.platform_restrictions) > 0 }
}
output "treasury_financial_accounts_restricted_features" {
  description = "Map of restricted_features values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no restricted_features are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.restricted_features if v.restricted_features != null && length(v.restricted_features) > 0 }
}
output "treasury_financial_accounts_status" {
  description = "Map of status values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no status are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.status if v.status != null && length(v.status) > 0 }
}
output "treasury_financial_accounts_status_details" {
  description = "Map of status_details values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no status_details are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.status_details if v.status_details != null && length(v.status_details) > 0 }
}
output "treasury_financial_accounts_supported_currencies" {
  description = "Map of supported_currencies values across all treasury_financial_accounts, keyed the same as var.treasury_financial_accounts except keys with no supported_currencies are omitted"
  value       = { for k, v in stripe_treasury_financial_account.treasury_financial_accounts : k => v.supported_currencies if v.supported_currencies != null && length(v.supported_currencies) > 0 }
}

