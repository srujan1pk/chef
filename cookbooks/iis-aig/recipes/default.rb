#
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2011-2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#

# Always add this, so that we don't require this to be added if we want to add other components

default = Opscode::IIS::Helper.older_than_windows2008r2? ? 'Web-Server' : 'IIS-WebServerRole'

([default] + node['iis']['components']).each do |feature|
  windows_feature feature do
    action :install
    all !Opscode::IIS::Helper.older_than_windows2012?
    source node['iis']['source'] unless node['iis']['source'].nil?
  end
end

service 'iis' do
  service_name 'W3SVC'
  action [:enable, :start]
end

directory "#{node['iis']['docroot']}/icons" do
  action :create
end

template "#{node['iis']['docroot']}/icons/Default.htm" do
source 'icons.erb'
end

iis_site 'icons' do
  action    [:add, :start]
  path      "#{node['iis']['docroot']}/icons"
  protocol  :http
  port      80
  notifies  :restart, 'service[iis]', :immediately
  not_if {::Dir.exists?("#{node['iis']['docroot']}/icons")}
end

include_recipe 'windows_firewall::default'