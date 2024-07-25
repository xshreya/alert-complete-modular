# module "policy" {
#   source = "./policy"
#   policy_name = var.policy_name
#   nr_account_id = var.nr_account_id
#   nr_api_key = var.nr_api_key
#   region-newrelic = var.region-newrelic
# }

# module "condition" {
#   source = "./condition"
#   policy_id = module.policy.policy_id
#   my-conditions = var.my-conditions
#   nr_account_id = var.nr_account_id
#   nr_api_key = var.nr_api_key
#   region-newrelic = var.region-newrelic
# }

# module "destination" {
#   source = "./destination"
#   recipient-email = var.recipient-email
#   nr_account_id = var.nr_account_id
#   nr_api_key = var.nr_api_key
#   region-newrelic = var.region-newrelic
# }

# module "channel" {
#   source = "./channel"
#   destination_id = module.destination.destination_id  
#   nr_account_id = var.nr_account_id
#   nr_api_key = var.nr_api_key
#   region-newrelic = var.region-newrelic
# }

# module "workflow" {
#   source = "./workflow"
#   channel_id = module.channel.channel_id
#   nr_account_id = var.nr_account_id
#   nr_api_key = var.nr_api_key
#   region-newrelic = var.region-newrelic  
# }


module "serviceLevel" {
  source = "./serviceLevels"
  nr_account_id = var.nr_account_id
  nr_api_key = var.nr_api_key
  region-newrelic = var.region-newrelic
  serviceLevels = var.serviceLevels
}