name "wordpress"
description "Blog using wordpress"
recipes "apt", "build-essential", "chef-client::service", "users::sysadmins",
        "sudo", "postfix", "mysql::server", "wordpress", "wordpress::deploy",
        "wordpress::blog_user", "wordpress::add_swap", "vsftpd"

override_attributes(
  "postfix" => {"myhostname" => "test.limbocat.com", "mydomain" => "limbocat.com"},
  "authorization" => {
    "sudo" => {
      "groups" => [],
      "users" => ["bcrocker_test", "ubuntu"],
      "passwordless" => true
    }
  },
  "wordpress" => {
     "server_aliases" => %w(test.limbocat.com),
     "version" => "3.3",
     "checksum" => "ba32a18d3fe263cbe095d846817173b808a74a497c3eab016149cdf8fcbb3e43",
     "blog_updater" => {
       "username" => "blog"
     }
   },
   "vsftpd" => {
      "ssl_certs_basename" => %w(test.limbocat.com),
      "chroot_users" => %w(blog)
      }
)
