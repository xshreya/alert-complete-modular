
variable "region-newrelic" {
  description = "newrelic region"
  type = string
}

variable "nr_account_id" {
  description = "New Relic Account ID"
  type        = number
}

variable "nr_api_key" {
  description = "New Relic API Key"
  type        = string
}


variable "channel_id" {
  type = string
}

variable "workflow_details" {
  type = object({
    workflow_name = string
    muting_rules_handling = string
    issue_filter_name = string
    issue_filter_type = string

    perdicate_attribute = string
    perdicate_operator = string
    perdicate_values = list(string)
  })
}