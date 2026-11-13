variable "treasury_financial_accounts" {
  description = <<EOT
Map of treasury_financial_accounts, attributes below
Required:
    - supported_currencies
Optional:
    - features
    - metadata
    - nickname
    - platform_restrictions
EOT

  type = map(object({
    supported_currencies = list(string)
    features = optional(object({
      card_issuing = optional(object({
        requested = bool
        status    = optional(string)
        status_details = optional(list(object({
          code        = optional(string)
          resolution  = optional(string)
          restriction = optional(string)
        })))
      }))
      deposit_insurance = optional(object({
        requested = bool
        status    = optional(string)
        status_details = optional(list(object({
          code        = optional(string)
          resolution  = optional(string)
          restriction = optional(string)
        })))
      }))
      financial_addresses = optional(object({
        aba = optional(object({
          requested = bool
          status    = optional(string)
          status_details = optional(list(object({
            code        = optional(string)
            resolution  = optional(string)
            restriction = optional(string)
          })))
        }))
      }))
      inbound_transfers = optional(object({
        ach = optional(object({
          requested = bool
          status    = optional(string)
          status_details = optional(list(object({
            code        = optional(string)
            resolution  = optional(string)
            restriction = optional(string)
          })))
        }))
      }))
      intra_stripe_flows = optional(object({
        requested = bool
        status    = optional(string)
        status_details = optional(list(object({
          code        = optional(string)
          resolution  = optional(string)
          restriction = optional(string)
        })))
      }))
      object = optional(string)
      outbound_payments = optional(object({
        ach = optional(object({
          requested = bool
          status    = optional(string)
          status_details = optional(list(object({
            code        = optional(string)
            resolution  = optional(string)
            restriction = optional(string)
          })))
        }))
        us_domestic_wire = optional(object({
          requested = bool
          status    = optional(string)
          status_details = optional(list(object({
            code        = optional(string)
            resolution  = optional(string)
            restriction = optional(string)
          })))
        }))
      }))
      outbound_transfers = optional(object({
        ach = optional(object({
          requested = bool
          status    = optional(string)
          status_details = optional(list(object({
            code        = optional(string)
            resolution  = optional(string)
            restriction = optional(string)
          })))
        }))
        us_domestic_wire = optional(object({
          requested = bool
          status    = optional(string)
          status_details = optional(list(object({
            code        = optional(string)
            resolution  = optional(string)
            restriction = optional(string)
          })))
        }))
      }))
    }))
    metadata = optional(map(string))
    nickname = optional(string)
    platform_restrictions = optional(object({
      inbound_flows  = optional(string)
      outbound_flows = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.object == null || (contains(["treasury.financial_account_features"], v.features.object)))
      )
    ])
    error_message = "must be one of: \"treasury.financial_account_features\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.card_issuing == null || (v.features.card_issuing.status == null || (contains(["active", "pending", "restricted"], v.features.card_issuing.status))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.card_issuing == null || (v.features.card_issuing.status_details == null || alltrue([for item in v.features.card_issuing.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))])))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.card_issuing == null || (v.features.card_issuing.status_details == null || alltrue([for item in v.features.card_issuing.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))])))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.card_issuing == null || (v.features.card_issuing.status_details == null || alltrue([for item in v.features.card_issuing.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))])))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.deposit_insurance == null || (v.features.deposit_insurance.status == null || (contains(["active", "pending", "restricted"], v.features.deposit_insurance.status))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.deposit_insurance == null || (v.features.deposit_insurance.status_details == null || alltrue([for item in v.features.deposit_insurance.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))])))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.deposit_insurance == null || (v.features.deposit_insurance.status_details == null || alltrue([for item in v.features.deposit_insurance.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))])))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.deposit_insurance == null || (v.features.deposit_insurance.status_details == null || alltrue([for item in v.features.deposit_insurance.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))])))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.financial_addresses == null || (v.features.financial_addresses.aba == null || (v.features.financial_addresses.aba.status == null || (contains(["active", "pending", "restricted"], v.features.financial_addresses.aba.status)))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.financial_addresses == null || (v.features.financial_addresses.aba == null || (v.features.financial_addresses.aba.status_details == null || alltrue([for item in v.features.financial_addresses.aba.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))]))))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.financial_addresses == null || (v.features.financial_addresses.aba == null || (v.features.financial_addresses.aba.status_details == null || alltrue([for item in v.features.financial_addresses.aba.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))]))))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.financial_addresses == null || (v.features.financial_addresses.aba == null || (v.features.financial_addresses.aba.status_details == null || alltrue([for item in v.features.financial_addresses.aba.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))]))))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.inbound_transfers == null || (v.features.inbound_transfers.ach == null || (v.features.inbound_transfers.ach.status == null || (contains(["active", "pending", "restricted"], v.features.inbound_transfers.ach.status)))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.inbound_transfers == null || (v.features.inbound_transfers.ach == null || (v.features.inbound_transfers.ach.status_details == null || alltrue([for item in v.features.inbound_transfers.ach.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))]))))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.inbound_transfers == null || (v.features.inbound_transfers.ach == null || (v.features.inbound_transfers.ach.status_details == null || alltrue([for item in v.features.inbound_transfers.ach.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))]))))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.inbound_transfers == null || (v.features.inbound_transfers.ach == null || (v.features.inbound_transfers.ach.status_details == null || alltrue([for item in v.features.inbound_transfers.ach.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))]))))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.intra_stripe_flows == null || (v.features.intra_stripe_flows.status == null || (contains(["active", "pending", "restricted"], v.features.intra_stripe_flows.status))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.intra_stripe_flows == null || (v.features.intra_stripe_flows.status_details == null || alltrue([for item in v.features.intra_stripe_flows.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))])))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.intra_stripe_flows == null || (v.features.intra_stripe_flows.status_details == null || alltrue([for item in v.features.intra_stripe_flows.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))])))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.intra_stripe_flows == null || (v.features.intra_stripe_flows.status_details == null || alltrue([for item in v.features.intra_stripe_flows.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))])))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.ach == null || (v.features.outbound_payments.ach.status == null || (contains(["active", "pending", "restricted"], v.features.outbound_payments.ach.status)))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.ach == null || (v.features.outbound_payments.ach.status_details == null || alltrue([for item in v.features.outbound_payments.ach.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))]))))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.ach == null || (v.features.outbound_payments.ach.status_details == null || alltrue([for item in v.features.outbound_payments.ach.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))]))))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.ach == null || (v.features.outbound_payments.ach.status_details == null || alltrue([for item in v.features.outbound_payments.ach.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))]))))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.us_domestic_wire == null || (v.features.outbound_payments.us_domestic_wire.status == null || (contains(["active", "pending", "restricted"], v.features.outbound_payments.us_domestic_wire.status)))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.us_domestic_wire == null || (v.features.outbound_payments.us_domestic_wire.status_details == null || alltrue([for item in v.features.outbound_payments.us_domestic_wire.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))]))))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.us_domestic_wire == null || (v.features.outbound_payments.us_domestic_wire.status_details == null || alltrue([for item in v.features.outbound_payments.us_domestic_wire.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))]))))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_payments == null || (v.features.outbound_payments.us_domestic_wire == null || (v.features.outbound_payments.us_domestic_wire.status_details == null || alltrue([for item in v.features.outbound_payments.us_domestic_wire.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))]))))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.ach == null || (v.features.outbound_transfers.ach.status == null || (contains(["active", "pending", "restricted"], v.features.outbound_transfers.ach.status)))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.ach == null || (v.features.outbound_transfers.ach.status_details == null || alltrue([for item in v.features.outbound_transfers.ach.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))]))))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.ach == null || (v.features.outbound_transfers.ach.status_details == null || alltrue([for item in v.features.outbound_transfers.ach.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))]))))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.ach == null || (v.features.outbound_transfers.ach.status_details == null || alltrue([for item in v.features.outbound_transfers.ach.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))]))))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.us_domestic_wire == null || (v.features.outbound_transfers.us_domestic_wire.status == null || (contains(["active", "pending", "restricted"], v.features.outbound_transfers.us_domestic_wire.status)))))
      )
    ])
    error_message = "must be one of: \"active\", \"pending\", \"restricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.us_domestic_wire == null || (v.features.outbound_transfers.us_domestic_wire.status_details == null || alltrue([for item in v.features.outbound_transfers.us_domestic_wire.status_details : (item.code == null || (contains(["activating", "capability_not_requested", "financial_account_closed", "rejected_other", "rejected_unsupported_business", "requirements_past_due", "requirements_pending_verification", "restricted_by_platform", "restricted_other"], item.code)))]))))
      )
    ])
    error_message = "must be one of: \"activating\", \"capability_not_requested\", \"financial_account_closed\", \"rejected_other\", \"rejected_unsupported_business\", \"requirements_past_due\", \"requirements_pending_verification\", \"restricted_by_platform\", \"restricted_other\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.us_domestic_wire == null || (v.features.outbound_transfers.us_domestic_wire.status_details == null || alltrue([for item in v.features.outbound_transfers.us_domestic_wire.status_details : (item.resolution == null || (contains(["contact_stripe", "provide_information", "remove_restriction"], item.resolution)))]))))
      )
    ])
    error_message = "must be one of: \"contact_stripe\", \"provide_information\", \"remove_restriction\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.features == null || (v.features.outbound_transfers == null || (v.features.outbound_transfers.us_domestic_wire == null || (v.features.outbound_transfers.us_domestic_wire.status_details == null || alltrue([for item in v.features.outbound_transfers.us_domestic_wire.status_details : (item.restriction == null || (contains(["inbound_flows", "outbound_flows"], item.restriction)))]))))
      )
    ])
    error_message = "must be one of: \"inbound_flows\", \"outbound_flows\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.platform_restrictions == null || (v.platform_restrictions.inbound_flows == null || (contains(["restricted", "unrestricted"], v.platform_restrictions.inbound_flows)))
      )
    ])
    error_message = "must be one of: \"restricted\", \"unrestricted\""
  }
  validation {
    condition = alltrue([
      for k, v in var.treasury_financial_accounts : (
        v.platform_restrictions == null || (v.platform_restrictions.outbound_flows == null || (contains(["restricted", "unrestricted"], v.platform_restrictions.outbound_flows)))
      )
    ])
    error_message = "must be one of: \"restricted\", \"unrestricted\""
  }
}

