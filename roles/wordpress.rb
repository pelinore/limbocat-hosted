name "wordpress"
description "Blog using wordpress"
recipes "apt", "build-essential", "chef-client::service", "users::sysadmins",
        "sudo", "postfix", "mysql::server", "wordpress", "wordpress::blog_user",
        "wordpress::add_swap", "vsftpd"

override_attributes(
  "postfix" => {"myhostname" => "test.limbocat.com", "mydomain" => "limbocat.com"},
  "authorization" => {
    "sudo" => {
      "groups" => [],
      "users" => ["bcrocker_test", "ubuntu"]
    }
  },
  "wordpress" => {
     "server_aliases" => %w(test.limbocat.com),
     "version" => "3.2.1",
     "checksum" => "21e3cebd02808f9ee39a979d22e6e10bce5356ddf7068aef182847b12c9b95a9",
     "weblog_title" => "LimbocatBlog",
     "user_name" => "brettc",
     "admin_email" => "brettc@limbocat.com",
     "public_view" => "1",
     "admin_password" => "Ya0JBvjGRnKc",
     "blog_updater" => {
       "username" => "blog",
       "password" => "big-secret"
     }
   },
   "vsftpd" => {"chroot_users" => %w(blog)}
)
