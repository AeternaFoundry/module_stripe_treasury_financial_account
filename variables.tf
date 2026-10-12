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
}

