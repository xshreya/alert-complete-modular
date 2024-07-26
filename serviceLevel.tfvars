region-newrelic = "US"

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