#
# Cookbook Name:: mysql-server
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe "servertools"
include_recipe "mysql::server"