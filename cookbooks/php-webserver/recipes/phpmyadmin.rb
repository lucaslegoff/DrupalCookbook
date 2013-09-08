package "phpmyadmin" do
  action :install
end

template "/etc/apache2/sites-available/phpmyadmin" do
  source "phpmyadmin_vhost.erb"
  mode "0660"
end

link "/etc/apache2/sites-enabled/phpmyadmin" do
	to "/etc/apache2/sites-available/phpmyadmin"
	notifies :restart, resources(:service => "apache2")
end