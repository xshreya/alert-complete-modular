
#DESTINATION 
resource "newrelic_notification_destination" "destination01" {
  account_id =  var.nr_account_id
  name = var.destination_details.name
  type = var.destination_details.type

  property {
    key = var.destination_details.property_key
    value = var.destination_details.recipient-email
  }
}