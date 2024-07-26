# WORKFLOW 
resource "newrelic_workflow" "workflow01" {
  name = var.workflow_details.name
  muting_rules_handling = var.workflow_details.muting_rules_handling

  issues_filter {
    name = var.workflow_details.issue_filter_name
    type = var.workflow_details.issue_filter_type

    predicate {
      attribute = var.workflow_details.perdicate_attribute
      operator = var.workflow_details.perdicate_operator
      values = var.workflow_details.perdicate_values
    }

    predicate {
      attribute = var.workflow_details.perdicate_attribute_policy
      operator = var.workflow_details.perdicate_operator_policy
      values = [ var.policy_id ]
    }
  }

  destination {
    channel_id = var.channel_id
  }
}

