default["tomcat"]["port"] = 8983
default['java']['jdk_version'] = '7'
default["tomcat"]["base_version"] = 7
default['tomcat']['keytool'] = "#{default['java']['java_home']}/bin/keytool"
default['java']['java_home'] = "#{default['java']['java_home']}"

default['solr']['version'] = "4.6.1"
default['solr']['checksum'] = "61f09ee980590b2a420c46a0999f7233f58eb8e4" #sha265
default['solr']['directory'] = "/usr/local/src"

if solr.version.split('.').first.to_i >= 4
  default['solr']['link']      = "http://archive.apache.org/dist/lucene/solr/#{default['solr']['version']}/solr-#{default['solr']['version']}.tgz"
  default['solr']['download']  = "#{default['solr']['directory']}/solr-#{default['solr']['version']}.tgz"
  default['solr']['extracted'] = "#{default['solr']['directory']}/solr-#{default['solr']['version']}"
  default['solr']['war']['file'] = "solr-#{default['solr']['version']}.war"
  default['solr']['war']['path'] = "#{default['solr']['extracted']}/dist/#{default['solr']['war']['file']}"
else
  default['solr']['link']      = "http://archive.apache.org/dist/lucene/solr/#{default['solr']['version']}/apache-solr-#{default['solr']['version']}.tgz"
  default['solr']['download']  = "#{default['solr']['directory']}/apache-solr-#{default['solr']['version']}.tgz"
  default['solr']['extracted'] = "#{default['solr']['directory']}/apache-solr-#{default['solr']['version']}"
  default['solr']['war']['file'] = "apache-solr-#{default['solr']['version']}.war"
  default['solr']['war']['path'] = "#{default['solr']['extracted']}/dist/#{default['solr']['war']['file']}"
end

default['solr']['home'] = "/opt/solr"