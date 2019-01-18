#this recipe is called from default

case node['platform']
when 'ubuntu'
    include_recipe 'apt'
    
    apt_package 'apache2' do
        action :install
    end

    service 'apache2' do
        supports status: true, restart: true, reload: true 
        action [ :enable, :start ]
    end

    template '/var/www/html/index.html' do
        source 'index.html.erb'
        action :create
    end
    

else
    logger.info("Platform not supported")
end
