package "phpmyadmin" do
  action :install
end

template "/etc/apache2/sites-available/phpmyadmin" do
  source "phpmyadmin_vhost.erb"
  mode "0660"
end

apache_site "phpmyadmin"