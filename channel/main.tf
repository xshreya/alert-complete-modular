#CHANNEL 
resource "newrelic_notification_channel" "channel01" {
  account_id = var.nr_account_id
  name = "channel01"
  type = "EMAIL"
  destination_id = var.destination_id
  product = "IINT"

  property {
    key = "subject"
    value = "ALERT!"
  }

  property {
    key = "customDetailsEmail"
    value = "Infra alerting"
  }
}
