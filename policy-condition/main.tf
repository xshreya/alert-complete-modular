# POLICY CREATION
resource "newrelic_alert_policy" "policy01" {
  name = var.policy_details.name
  incident_preference =  var.policy_details.incident_preference # PER_POLICY is default
}


# CONDITION 
resource "newrelic_nrql_alert_condition" "condition" {
  for_each = var.my-conditions
  policy_id                      = newrelic_alert_policy.policy01.id
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

  

  dynamic "critical" {
    for_each = each.value.critical != null ? [each.value.critical] : []
    content {
      operator              = critical.value.operator
      threshold             = critical.value.threshold
      threshold_duration    = critical.value.threshold_duration
      threshold_occurrences = critical.value.threshold_occurrences
    }
  }

  dynamic "warning" {
    for_each = each.value.warning.operator  != null ? [each.value.warning] : []
    content {
      operator              = warning.value.operator
      threshold             = warning.value.threshold
      threshold_duration    = warning.value.threshold_duration
      threshold_occurrences = warning.value.threshold_occurrences
    }
  }
}
