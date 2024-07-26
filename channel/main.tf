#CHANNEL 
resource "newrelic_notification_channel" "channel01" {
  account_id = var.nr_account_id
  name = var.channel_details.name
  type = var.channel_details.type
  destination_id = var.destination_id
  product = var.channel_details.product

  property {
    key = var.channel_details.subject_property_key
    value = var.channel_details.subject_property_value
  }


  property {
    key = var.channel_details.details_property_key
    value = var.channel_details.details_property_value
  }
}
