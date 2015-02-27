#
# Cookbook Name:: php-env
# Recipe:: default
#
# Copyright 2014, Jun Katagiri
#
# All rights reserved - Do Not Redistribute
#
%w{php5 php5-dev php5-fpm php5-xdebug php5-mysql mcrypt php5-mcrypt}.each do |pkg|
  package pkg do
    action :install
    notifies :restart, "service[php5-fpm]"
  end
end

service "php5-fpm" do
  provider ::Chef::Provider::Service::Upstart
  action [:enable, :start]
  supports status: true, restart: true, reload: true
end

template "/etc/php5/mods-available/xdebug.ini" do
  owner 'root'
  group 'root'
  mode  '0644'
  notifies :restart, "service[php5-fpm]"
end

execute 'sudo php5enmod mcrypt' do
  command 'sudo php5enmod mcrypt'
  notifies :restart, "service[php5-fpm]"
end


