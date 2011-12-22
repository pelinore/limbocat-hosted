#
# creates the role timezone
#
# propervalues to set can be found in the standard tz database, location below
#
#    http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
#
name "timezone"
description "configures the timezone to a default set in the attribute section"
run_list [
    "recipe[timezone]"
]

override_attributes(
  "tz" => "America/Chicago"
)
