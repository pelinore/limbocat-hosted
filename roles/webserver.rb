name "webserver"
description "webserver role"
run_list [
    "recipe[apache2]"
]
