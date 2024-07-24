variable "my-conditions" {
  description = "condition configuration"
  type = map(map(any))
}

variable "nr_account_id" {
  description = "New Relic Account ID"
  type        = number
}

variable "policy_id" {
  type = string
}

variable "region-newrelic" {
  description = "newrelic region"
  type = string
}

variable "nr_api_key" {
  description = "New Relic API Key"
  type        = string
}
