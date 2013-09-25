package "ntp" do
	action :install
end

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  mode "0644"
  variables :ntp_servers => node['ntp']['servers']
  notifies :restart, "service[ntp]"
end

service "ntp" do
  supports :status => true, :restart => true
  action   [:enable, :start]
end

