
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

variable "destination_id" {
  type = string
}