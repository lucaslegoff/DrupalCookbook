# from the apt cookbook on opscode website

# Run apt-get update to create the stamp file
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  not_if do ::File.exists?('/var/lib/apt/periodic/update-success-stamp') end
end

# For other recipes to call to force an update
execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

# Automatically remove packages that are no longer needed for dependencies
execute "apt-get autoremove" do
  command "apt-get -y autoremove"
  action :nothing
end

# Automatically remove .deb files for packages no longer on your system
execute "apt-get autoclean" do
  command "apt-get -y autoclean"
  action :nothing
end

# provides /var/lib/apt/periodic/update-success-stamp on apt-get update
package "update-notifier-common" do
  notifies :run, 'execute[apt-get-update]', :immediately
end

execute "apt-get-update-periodic" do
  command "apt-get update"
  ignore_failure true
  only_if do
    ::File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
    ::File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
  end
end