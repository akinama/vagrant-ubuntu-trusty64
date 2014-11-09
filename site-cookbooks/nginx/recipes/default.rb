#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, Jun Katagiri
#
# All rights reserved - Do Not Redistribute
user "www-data" do
  action :create
end

group "www-data" do
  action :create
  members "www-data"
  append true
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
  supports status: true, restart: true, reload: true
end

template "/etc/nginx/nginx.conf" do
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :restart, "service[nginx]"
end
