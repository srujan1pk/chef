
repo = 'c:/chef'

file_cache_path File.join(repo, 'chef-solo')
data_bag_path   File.join(repo, 'data_bags')
cookbook_path   File.join(repo, 'cookbooks')
role_path       File.join(repo, 'roles')