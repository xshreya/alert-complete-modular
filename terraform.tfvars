region-newrelic = "US"

# provider_info = {
#   region-newrelic = "US"
# }


#policy
policy_details = {
  name = "policy01"
  incident_preference = "PER_CONDITION"
}

# condition
my-conditions = {
  "condiiton1" = {
    name = "cpuPercent"
    description = "cpu usage percentage"
    enabled = true
    fill_option_value = "last_value"
    violation_time_limit_seconds = 3600
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "FROM SystemSample SELECT average(cpuPercent) WHERE entityName = 'DESKTOP-1FTVP0P'"
    crt_operator = "above"
    critical_threshold = 80
    warning_threshold = 60
    crt_threshold_occurences = "ALL"
    war_operator = "above"
    crt_threshold_duration = 300
    war_threshold_duration = 300
    war_threshold_occurences = "ALL"
      }, 
  "condition2" = {
    name = "memoryPercent"
    description = "memory usage percentage"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "FROM SystemSample SELECT average(memoryUsedPercent) WHERE entityName = 'DESKTOP-1FTVP0P'"
    crt_operator = "above"
    critical_threshold = 80
    crt_threshold_duration = 300
    crt_threshold_occurences = "ALL"
    war_operator = "above"
    warning_threshold = 60
    war_threshold_duration = 300
    war_threshold_occurences = "ALL"
  }, 
  "condition3" = {    
    name = "diskPercent"
    description = "disk usage percentage"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "FROM SystemSample SELECT average(diskUsedPercent) WHERE entityName = 'DESKTOP-1FTVP0P'"
    crt_operator = "above"
    critical_threshold = 80
    warning_threshold = 60
    crt_threshold_occurences = "ALL"
    war_operator = "above"
    crt_threshold_duration = 300
    war_threshold_duration = 300
    war_threshold_occurences = "ALL"
  }, 
  "condition4" = {
    name = "networkIngress"
    description = "network Ingress"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "SELECT average(receiveBytesPerSecond) FROM NetworkSample WHERE entityName = 'DESKTOP-1FTVP0P'"
    crt_operator = "above"
    critical_threshold = 1000
    warning_threshold = 800
    crt_threshold_occurences = "ALL"
    war_operator = "above"
    crt_threshold_duration = 300
    war_threshold_duration = 300
    war_threshold_occurences = "ALL"
  }, 
  "condition5" = {
    name = "networkEgress"
    description = "network Egress"
    enabled = true
    fill_option_value = "last_value"
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by = 30
    violation_time_limit_seconds = 3600
    query = "SELECT average(transmitBytesPerSecond) FROM NetworkSample WHERE entityName = 'DESKTOP-1FTVP0P'"
    crt_operator = "above"
    critical_threshold = 1000
    warning_threshold = 800
    crt_threshold_occurences = "ALL"
    war_operator = "above"
    crt_threshold_duration = 300
    war_threshold_duration = 300
    war_threshold_occurences = "ALL"
  }
}

# DESTINATION 
destination_details = {
  name = "destination01"
  type = "EMAIL"
  property_key = "email"
  recipient-email = "xshreya.sharma@gmail.com"
}

#channel 
channel_details = {
    name = "channel01"
    type = "EMAIL"
    product = "IINT"
    subject_property_key = "subject"
    subject_property_value = "ALERT!"
    details_property_key = "customDetailsEmail"
    details_property_value = "Infra alerting"
}

#workflow
workflow_details = {
  name = "workflow01"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"
  issue_filter_name = "filter"
  issue_filter_type = "FILTER"

  perdicate_attribute = "priority"
  perdicate_operator = "EXACTLY_MATCHES"

  perdicate_values = [ "critical" ]

  perdicate_attribute_policy = "labels.policyIds"
  perdicate_operator_policy = "EXACTLY_MATCHES"
}


#service-levels
serviceLevels = {
  "sl1" = {
    name = "sl1-host-availability"
    description = "Host Availability"
    entity-guid = "NDU1MDg1N3xJTkZSQXxOQXw3ODQxNTY5MjY0NDI5MzkxMzU5"
    valid_from = "SystemSample"
    valid_where = "entityGuid = 'NDU1MDg1N3xJTkZSQXxOQXw3ODQxNTY5MjY0NDI5MzkxMzU5'"
    good_from = "SystemSample"
    good_where = "hostStatus ='running'"
    bad_from = ""
    bad_where = ""
    valid_select = "COUNT"
    good_select = "COUNT"
    bad_select = "COUNT"
    target = 99
    rolling_count = 7
    rolling_unit = "DAY"
  },
  "sl2" = {
    name = "sl2-synthetic-success"
    description = "Proportion of successful synthetic checks."
    entity-guid = "NDU1MDg1N3xTWU5USHxNT05JVE9SfGQ1ZjcxOTg1LTkzM2MtNGVkNi05MGE4LWJhODY3ZmY5MjAzNw"
    valid_from = "SyntheticCheck"
    valid_where = "entityGuid = 'NDU1MDg1N3xTWU5USHxNT05JVE9SfGQ1ZjcxOTg1LTkzM2MtNGVkNi05MGE4LWJhODY3ZmY5MjAzNw'"
    valid_select = "COUNT"
    good_from = "SyntheticCheck"
    good_where = "entityGuid = 'NDU1MDg1N3xTWU5USHxNT05JVE9SfGQ1ZjcxOTg1LTkzM2MtNGVkNi05MGE4LWJhODY3ZmY5MjAzNw' AND result='SUCCESS'"
    good_select = "COUNT"
    bad_from = ""
    bad_where = ""
    bad_select = "COUNT"
    target = 99
    rolling_count = 7
    rolling_unit = "DAY"
  },
  "sl3" = {
    name = "sl3-success-Browser"
    description = "Proporiton of Page Views that are served without errors"
    entity-guid = "NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ"
    valid_from = "PageView"
    valid_where = "entityGuid = 'NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ'"
    valid_select = "COUNT"
    good_from = ""
    good_where = ""
    good_select = ""
    bad_from = "JavaScriptError"
    bad_where = "entityGuid = 'NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ' AND firstErrorInSession IS true"
    bad_select = "COUNT"
    target = 99.99
    rolling_count = 7
    rolling_unit = "DAY"
  }, 
  "sl4" = {
    name = "sl4-lcp"
    description = "Proportion of page views where the largest content element visible in the viewport was rendered faster than a threshold."
    entity-guid = "NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ"
    valid_from = "PageViewTiming"
    valid_where = "entityGuid = 'NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ' AND largestContentfulPaint IS NOT NULL"
    valid_select = "COUNT"
    good_from = "PageViewTiming"
    good_where = "entityGuid = 'NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ' AND largestContentfulPaint < 0.01"
    good_select = "COUNT"
    bad_from = ""
    bad_where = ""
    bad_select = ""
    target = 95
    rolling_count = 7
    rolling_unit = "DAY"
  }, 
  "sl5" = {
    name = "sl5-inp"
    description = "Proportion of web pages where the delay between user actions and the browser's response is shorter than the threshold."
    entity-guid = "NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ"
    valid_from = "PageViewTiming"
    valid_where = "entityGuid = 'NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ' AND interactionToNextPaint IS NOT NULL"
    valid_select = "COUNT"
    good_from = "PageViewTiming"
    good_where = "entityGuid = 'NDU1MDg1N3xCUk9XU0VSfEFQUExJQ0FUSU9OfDYwMTQ4NTU5NQ' AND interactionToNextPaint < 0.01"
    good_select = "COUNT"
    bad_from = ""
    bad_where = ""
    bad_select = ""
    target = 95
    rolling_count = 7
    rolling_unit = "DAY"
  }
}