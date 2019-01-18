# This recepie is called from default.rb
# require 'pry-remote'
# binding.pry
include_recipe 'java'
include_recipe 'jenkins::master'

plugins = ['build-pipeline-plugin', 'jenkins-multijob-plugin', 'git','dashboard-view', 'maven-plugin', 'view-job-filters', 'ssh-slaves', 'gradle', 'workflow-cps', 'mask-passwords', 'python']

# node.default['jenkins']['master']['jvm_options'] = '-Djava.io.tmpdir=/var/jenkins/tmp -Dhudson.model.UpdateCenter.never=true -Djenkins.install.runSetupWizard=false -Dhudson.model.ParametersAction.keepUndefinedParameters=true'
# node.default['jenkins']['master']['port'] = 80
# node.default['jenkins']['master']['endpoint'] = "http://#{node['jenkins']['master']['host']}:#{node['jenkins']['master']['port']}"
# node.default['jenkins']['master']['install_method'] = 'package'
# node.default['jenkins']['server']['user'] = 'root'

slaves = search(:node, 'role:jenkins-slave')

case node['platform']
when 'ubuntu'
    include_recipe 'apt'

    template "#{node['jenkins']['master']['home']}/config.xml" do
        source 'config.xml.erb'
    end

    template "#{node['jenkins']['master']['home']}/hudson.tasks.Maven.xml" do
        source 'hudson.tasks.Maven.xml.erb'
    end

    # template 'etc/default/jenkins' do
    #     source 'jenkins.erb'
    #     owner 'jenkins'
    #     # notifies :execute, 'jenkins_command[safe-restart]'
    # end

    jenkins_command 'reload-configuration'

    job_config = File.join(Chef::Config[:file_cache_path], 'job-config.xml')

    template job_config do
        source 'job-config.xml.erb'
    end

    jenkins_command 'safe-restart' do
        action :nothing
    end

    plugins.each.with_index do |plug, index| 
        jenkins_plugin "#{plug}" do
            action :install
            if index == plugins.size - 1
                notifies :execute, 'jenkins_command[safe-restart]', :immediately
            end
        end
    end

    jenkins_plugin 'ssh-credentials' do
        action :install
        notifies :execute, 'jenkins_command[safe-restart]'
    end

    user 'jenkins' do
        password 'jenkins'
    end

    group "create jenkins sudo" do
        group_name 'sudo'
        members 'jenkins'
        action :modify
        append true
    end
    
    # jenkins_ssh_slave 'jenkins' do
    #         description 'Assist the master'
    #         remote_fs '/home/jenkins/'
    #         labels ['assistant', 'jenkins_slave', 'jail']
    #         host "172.25.0.8" 
    #         user 'jenkins'
    #         credentials 'jenkins'
    #         launch_timeout 30
    #         ssh_retries 5
    #         ssh_wait_retries 60
    # end
   
else
    log "Unsopported OS platform #{node['platform']}" do
        level :error
    end
end

# case node['platform']
# when 'ubuntu'


#     service 'jenkins' do
#         supports [:start, :stop, :restart]
#         action [:enable, :start]
#     end

# when 'rhel'
#     package 'java-1.8.0-openjdk' do
#         action :install
#     end
# else
#     raise "This platform is not supported is not supported"
# end



        
