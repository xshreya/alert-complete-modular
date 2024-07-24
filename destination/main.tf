
#DESTINATION 
resource "newrelic_notification_destination" "destination01" {
  account_id =  var.nr_account_id
  name = "destination01"
  type = "EMAIL"

  property {
    key = "email"
    value = var.recipient-email
  }
}