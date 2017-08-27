#################################################################

This Chef Repo uses chef-solo to install the IIS WebServer and Windows Latest Updates.

#################################################################

This Setup needs Latest Chef-DK/Chef-Client, GitBash to be installed.

Chef-DK: https://downloads.chef.io/chefdk

Chef-Client: https://downloads.chef.io/chef/stable/13.3.42

GitBash: https://git-scm.com/downloads

#################################################################

chef-solo can be initiated from Powershell as shown below:

--> cd C:\chef

--> chef-solo -c chef-solo\solo.rb -j chef-solo\node.json

#################################################################