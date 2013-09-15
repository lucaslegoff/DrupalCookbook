#
# Cookbook Name:: servertools
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "servertools::vim"
include_recipe "servertools::htop"
include_recipe "servertools::createUsers"
