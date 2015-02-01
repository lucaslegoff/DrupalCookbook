default["tomcat"]["port"] = 8983
#default['tomcat']['keytool'] = "#{default['java']['java_home']}/bin/keytool"

default['solr']['version'] = "4.6.1"
default['solr']['checksum'] = "5ee861d7ae301c0f3fa1e96e4cb42469531d8f9188d477351404561b47e55d94" #sha265
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