#update packages a and install Java

include_recipe 'apt'
include_recipe 'java'


user 'jenkins' do
    comment 'user for jenkins slave'
    home '/home/jenkins'
    shell '/bin/bash'
    password 'jenkins'
    action :create
end


group 'jenkins' do
    members 'jenkins'
    action :create
end