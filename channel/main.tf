#CHANNEL 
resource "newrelic_notification_channel" "channel01" {
  account_id = var.nr_account_id
  name = "channel01"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.destinaiton01.id
  product = "IINT"

  property {
    key = "subject"
    value = "ALERT!"
  }

  property {
    key = "customDetailsEmail"
    value = "Changes in the Infrastructure"
  }
}
