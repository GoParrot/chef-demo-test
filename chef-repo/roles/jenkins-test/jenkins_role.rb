name 'jenkins-master'
description 'This role is for jenkins server'
default_attributes(
  "java" => {
    "install_flavor" => "oracle",
    "jdk_version" => "8",
    "oracle" => {
      "accept_oracle_download_terms" => true
    }
  },
  'jenkins' => {
    "install_method" => "package",
    "port" => "80"
  }
)
run_list(
  "recipe[apt]",
  "recipe[java]",
  "recipe[jenkins-test::default]"
)
# /usr/bin/java -Djenkins.install.runSetupWizard=false -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpListenAddress=0.0.0.0 --httpPort=80 --ajp13Port=-1