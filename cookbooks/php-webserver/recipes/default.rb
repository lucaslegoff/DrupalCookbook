#
# Cookbook Name:: php-webserver
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "servertools"
include_recipe "apache2"
include_recipe "php-webserver::php"