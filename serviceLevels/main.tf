resource "newrelic_service_level" "serviceLevel" {
    for_each = var.serviceLevels
    guid = each.value.entity-guid
    name = each.value.name
    description = each.value.description

    events {
        account_id = var.nr_account_id
        valid_events {
            from = each.value.valid_from
            select {
              function = each.value.valid_select
            }
            where = each.value.valid_where
        }

        dynamic "good_events" {
            for_each = each.value.good_from != "" ? [each.value.good_from] : []
            content {
            from = each.value.good_from
            select {
                function = each.value.good_select
            }
            where = each.value.good_where
            }
        }

        dynamic "bad_events" {
            for_each = each.value.bad_from != "" ? [each.value.bad_from] : []
            content {
            from = each.value.bad_from
            select {
                function = each.value.bad_select
            }
            where = each.value.bad_where
            }
        }
    }

    objective {
        target = each.value.target
        time_window {
            rolling {
                count = each.value.rolling_count
                unit = "DAY"
            }
        }
    }
}