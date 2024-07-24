# WORKFLOW 
resource "newrelic_workflow" "infra-workflow" {
  name = "workflow01"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "filter"
    type = "FILTER"

    predicate {
      attribute = "priority"
      operator = "EXACTLY_MATCHES"
      values = [ "critical" ]
    }
  }

  destination {
    channel_id = var.channel_id
  }
}

