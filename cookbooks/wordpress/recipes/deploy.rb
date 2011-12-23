#
# Cookbook Name:: wordpress
# Recipe:: deploy
#
# Adapted from the wordpress-deploy scripts found at the location below
#    https://github.com/newsapps/wordpress-deploy
#
# Copyright 2011, Limbocat LLC
#

directory "#{node['wordpress']['dir']}/wp-content/custom-php" do
  owner "root"
  group "root"
  mode "0644"
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
    :weblog_title   => node['wordpress']['weblog_title'],
    :user_name      => node['wordpress']['user_name'],
    :admin_email    => node['wordpress']['admin_email'],
    :public_view    => node['wordpress']['public_view'],
    :admin_password => node['wordpress']['admin_password']
  )
end