module "policy-condition" {
  source = "./policy-condition"
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region-newrelic = var.region-newrelic
  policy_details = var.policy_details
  my-conditions = var.my-conditions
}

module "destination" {
  source = "./destination"
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region-newrelic = var.region-newrelic
  destination_details = var.destination_details
}

module "channel" {
  source = "./channel"
  destination_id = module.destination.destination_id  
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region-newrelic = var.region-newrelic
  channel_details = var.channel_details

}


module "workflow" {
  source = "./workflow"
  channel_id = module.channel.channel_id
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region-newrelic = var.region-newrelic
  policy_id = module.policy-condition.policy_id
  workflow_details = var.workflow_details
}


module "serviceLevel" {
  source = "./serviceLevels"
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region-newrelic = var.region-newrelic
  serviceLevels = var.serviceLevels
}