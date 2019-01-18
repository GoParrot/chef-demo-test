include_recipe 'nginx::repo'

load_servers = search(:node, 'role:deploy_nodes')

case node['platform']
when 'ubuntu' 
    include_recipe 'apt'

    apt_package 'nginx' do
        action :install
    end

    # template '/etc/nginx/nginx.conf' do
    #     source 'nginx.conf.erb'
    #     load_servers.each do |server|
    #         variables(:node => server)
    #     end
    #     action :create
    # end
    template '/etc/nginx/nginx.conf' do
            source 'nginx.conf.erb'
            variables(:nodes => load_servers)
            action :create
            notifies :restart, 'service[nginx]'
    end

    service 'nginx' do
            supports :status => true, :restart => true, :reload => true
            action [:enable, :start]
            retries 3
    end
end