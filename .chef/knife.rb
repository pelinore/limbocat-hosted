current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "bcrocker"
client_key               "#{current_dir}/bcrocker.pem"
validation_client_name   "limbocat-validator"
validation_key           "#{current_dir}/limbocat-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/limbocat"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
