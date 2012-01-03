name "ddclient"
description "ddclient setup for zoneedit"
run_list [
    "recipe[ddclient]"
]

override_attributes(
  "ddclient" => {
    "domain" => "test.limbocat.com",
    "protocol" => "zoneedit1",
    "use" => "web, web='http://legacy.zoneedit.com/checkip.html', web-skip='IP Address'",
    "server" => "dynamic.zoneedit.com",
    "interval" => "300"
  }
)
