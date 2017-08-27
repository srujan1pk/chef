# Cookbook:: iis
# Attribute:: default


default['iis']['home']       = "#{ENV['WINDIR']}\\System32\\inetsrv"
default['iis']['conf_dir']   = "#{ENV['WINDIR']}\\System32\\inetsrv\\config"
default['iis']['pubroot']    = "#{ENV['SYSTEMDRIVE']}\\inetpub"
default['iis']['docroot']    = "#{ENV['SYSTEMDRIVE']}\\inetpub\\wwwroot"
default['iis']['log_dir']    = "#{ENV['SYSTEMDRIVE']}\\inetpub\\logs\\LogFiles"
default['iis']['cache_dir']  = "#{ENV['SYSTEMDRIVE']}\\inetpub\\temp"
default['iis']['components'] = []

default['iis']['source'] = nil
