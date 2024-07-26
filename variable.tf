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

# POLICY
variable "policy_details" {
  type = object({
    name = string
    incident_preference = string
  })
}

# CONDITION
variable "my-conditions" {
  description = "condition configuration"
  type = map(map(any))
}

# DESTINATION
variable "destination_details" {
  type = object({
    name = string
    type = string
    property_key = string
    recipient-email = string
  })
}

# CHANNEL 
variable "channel_details" {
  type = object({
    name = string
    type = string
    product = string
    subject_property_key = string
    subject_property_value = string
    details_property_key = string
    details_property_value = string
  })
}


# WORKFLOW
variable "workflow_details" {
  type = object({
    name = string
    muting_rules_handling = string
    issue_filter_name = string
    issue_filter_type = string

    perdicate_attribute = string
    perdicate_operator = string
    perdicate_values = list(string)

    perdicate_attribute_policy = string
    perdicate_operator_policy = string
  })
}


variable "serviceLevels" {
  description = "service level details"
  type = map(map(any))
}