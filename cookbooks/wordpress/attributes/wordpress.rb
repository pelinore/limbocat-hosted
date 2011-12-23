default[:wordpress][:blog_updater][:username] = "blog"

::Chef::Node.send(:include, Opscode::OpenSSL::Password)

default[:wordpress][:blog_updater][:password] = secure_password
# hash set by recipe or manually using makepasswd
default[:wordpress][:blog_updater][:hash] = nil

# For creating the swap partition. Swap_size is in GB
default[:wordpress][:gb_swap_size] = 2
default[:wordpress][:swap_file] = "/swap_file"

# for automating blog creation, as adapted from the wordpress-deploy project
default[:wordpress][:weblog_title] = "My automatic blog"
default[:wordpress][:user_name] = "admin"
default[:wordpress][:admin_email] = "me@example.com"
default[:wordpress][:public_view] = 1
default[:wordpress][:admin_password] = secure_password
