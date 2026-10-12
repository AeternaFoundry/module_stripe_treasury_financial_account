resource "stripe_treasury_financial_account" "treasury_financial_accounts" {
  for_each = var.treasury_financial_accounts

  supported_currencies  = each.value.supported_currencies
  features              = each.value.features
  metadata              = each.value.metadata
  nickname              = each.value.nickname
  platform_restrictions = each.value.platform_restrictions
}

