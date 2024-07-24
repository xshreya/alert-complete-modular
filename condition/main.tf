# CONDITION 
resource "newrelic_nrql_alert_condition" "condition" {
  for_each = var.my-conditions
  policy_id                      = var.policy_id
  account_id                     = var.nr_account_id
  name                           = each.value.name
  description                    = each.value.description
  # runbook_url                    = "https://www.example.com"
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option_value
  # fill_value                     = 1.0
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by

  nrql {
    query = each.value.query
  }

  critical {
    operator              = "above"
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.crt_threshold_duration
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.war_threshold_duration
    threshold_occurrences = "ALL"
  }
}
