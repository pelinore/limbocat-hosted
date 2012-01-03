#
# Cookbook Name:: wordpress
# Recipe:: deploy
#
# Adapted from the wordpress-deploy scripts found at the location below
#    https://github.com/newsapps/wordpress-deploy
#
# Copyright 2011, Limbocat LLC
#
deploy_creds = Chef::EncryptedDataBagItem.load("secrets","wordpress_deploy")

directory "#{node['wordpress']['dir']}/wp-content/custom-php" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

cookbook_file "#{node['wordpress']['dir']}/wp-content/custom-php/install_includes.php" do
  source "install_includes.php"
  mode "0644"
end


template "#{node['wordpress']['dir']}/wp-content/install.php" do
  source "install.php.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :weblog_title   => deploy_creds['weblog_title'],
    :user_name      => deploy_creds['user_name'],
    :admin_email    => deploy_creds['admin_email'],
    :public_view    => node['wordpress']['deploy']['public_view'],
    :admin_password => deploy_creds['admin_password']
  )
end
