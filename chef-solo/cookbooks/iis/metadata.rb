name 'iis'
maintainer 'Srujan Kandukuri'
maintainer_email 'srujan.kandukuri@elantecs.com'
license 'All Rights Reserved'
description 'Installs/Configures iis Webserver'
long_description 'Installs/Configures iis Webserver'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
depends "windows", ">= 2.0"
depends "windows_firewall", ">= 1.0"
supports "windows", ">= 0.0.0"

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/chef-aig>/iis/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/chef-aig/iis'
