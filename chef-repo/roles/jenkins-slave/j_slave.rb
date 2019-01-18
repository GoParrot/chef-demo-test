name 'jenkins-slave'
description 'Jenkins Slave role'
default_attributes(
    "java" => {
      "install_flavor" => "oracle",
      "jdk_version" => "8",
      "oracle" => {
        "accept_oracle_download_terms" => true
      }
    }
  )
  run_list(
    "recipe[jenkins-slave::default]"
  )
