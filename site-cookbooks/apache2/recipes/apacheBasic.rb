#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "apache2" do
	action :install
end

service "apache2" do	
    supports [:restart, :reload]
  	action :enable
end

template "/etc/apache2/ports.conf" do
  source "ports.conf.erb"
  variables :apache_listen_ports => node['apache']['listen_ports'].map { |p| p.to_i }.uniq
  notifies :restart, "service[apache2]"
end