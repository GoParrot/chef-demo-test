current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "admin" 
client_key                "#{current_dir}/admin.pem"
validation_client_name   'my_org-validator'
validation_key           '/root/.chef/my_org-validator.pem'
chef_server_url           "https://chef-server:443/organizations/my_org" 
cookbook_path             ["/root/chef-repo/cookbooks"]
