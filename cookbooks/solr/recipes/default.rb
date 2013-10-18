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

directory node['solr']['home'] do
  owner node["tomcat"]["user"]
  group node['tomcat']['group']
  mode "755"
  recursive true
  action :create
end

#copy files to solr home
bash "copy config files" do
  code "cp -r #{node.solr.extracted}/example/solr/* #{node.solr.home}"
end

bash "copy war files" do
  code "cp #{node.solr.war} #{node.solr.home}/"
  creates #{node.solr.war}
end

