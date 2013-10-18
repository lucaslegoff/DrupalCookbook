override["tomcat"]["port"] = 8983
override['tomcat']['keytool'] = "/usr/lib/jvm/java-6-openjdk/bin/keytool"
override['java']['java_home'] = "/usr/lib/jvm/java-6-openjdk"

default['solr']['version'] = "3.6.1"
default['solr']['checksum'] = "1b4552ba95c8456d4fbd596e82028eaa0619b6942786e98e1c4c31258543c708" #sha265
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