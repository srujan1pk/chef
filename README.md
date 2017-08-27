###############################################################

This Chef Repo uses chef-solo to install the IIS WebServer and Windows Latest Updates.

###############################################################

This Setup needs Latest Chef-DK, WinRaR, Git Bash to be installed.

chef-solo can be initiated from Powershell as shown below:

--> cd C:\chef

--> chef-solo -c chef-solo\solo.rb -j chef-solo\node.json