name 'jenkins-test'
maintainer 'Marko Petrovic'
maintainer_email 'mrpetrovic@outlook.com'
license 'All Rights Reserved'
description 'Installs/Configures jenkins'
long_description 'Installs/Configures jenkins'
version '0.1.4'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'apt', '~> 7.1.1' 
depends 'java', '~> 3.1.1'
depends 'jenkins','~> 6.2.1'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/jenkins/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/jenkins'
