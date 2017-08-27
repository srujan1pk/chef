#
# Cookbook:: iis
# Recipe:: default
#

webserver = Opscode::IIS::Helper.older_than_windows2008r2? ? 'Web-Server' : 'IIS-WebServerRole'

([webserver] + node['iis']['components']).each do |comps|
  windows_feature comps do
    action :install
    all !Opscode::IIS::Helper.older_than_windows2012?
  end
end

#powershell_script 'Install IIS' do
#code 'Add-WindowsFeature Web-Server'
#end

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