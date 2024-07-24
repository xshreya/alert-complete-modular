# POLICY CREATION
resource "newrelic_alert_policy" "policy01" {
  name = var.policy_name
  incident_preference = "PER_CONDITION" # PER_POLICY is default
}
