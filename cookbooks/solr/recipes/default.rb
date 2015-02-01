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

if node["solr"]["instances"]

  	node["solr"]["instances"].each do |name|

  		directory "#{node['solr']['home']}/#{name}" do
		  owner node["tomcat"]["user"]
		  group node['tomcat']['group']
		  mode "755"
		  recursive true
		  action :create
		end

		#copy files to solr home
		bash "copy config files" do
		  code "cp -r #{node['solr']['extracted']}/example/solr/* #{node['solr']['home']}/#{name}"
		end

		#copy lib files for slf4j
		bash "copy lib files" do
		  code "cp -r #{node['solr']['extracted']}/example/lib/ext/* /var/lib/tomcat#{node["tomcat"]["base_version"]}/common"
		end

		bash "copy war files" do
		  code "cp #{node['solr']['war']['path']} #{node['solr']['home']}/#{name}/"
		  creates #{node['solr']['war']['path']}
		end

		#tomcat application config file
		template "#{node['solr']['home']}/#{name}/#{name}.xml" do
			source "solr-tomcatFragment.xml.erb"
			owner node["tomcat"]["user"]
		  	group node['tomcat']['group']
		  	mode "755"
		  	variables :solrInstanceName => name
		  	notifies :restart, "service[tomcat]"
		end

		link "#{node['tomcat']['config_dir']}/Catalina/localhost/#{name}.xml" do
			to "#{node['solr']['home']}/#{name}/#{name}.xml"
		end

  		bash "change-permission-#{node['solr']['home']}/#{name}" do
          code "chown -R #{node["tomcat"]["user"]}:#{node['tomcat']['group']} #{node['solr']['home']}/#{name}"
        end

	end

end

