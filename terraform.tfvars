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
  workflow_name = "infra-workflow"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"
  issue_filter_name = "filter"
  issue_filter_type = "FILTER"

  perdicate_attribute = "priority"
  perdicate_operator = "EXACTLY_MATCHES"

  perdicate_values = [ "critical" ]
}