#
# Cookbook Name:: solr
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "tomcat"
include_recipe "tomcat::users"

#Download solr archive
remote_file node['solr']['download'] do
  source   node['solr']['link']
  checksum node['solr']['checksum']
  mode     0644
end

#extract content
bash 'unpack solr' do
  code   "tar xzf #{node['solr']['download']} -C #{node['solr']['directory']}"
  not_if "test -d #{node['solr']['extracted']}"
end