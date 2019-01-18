name 'nginx-test'
maintainer 'The Authors'
maintainer_email 'mrpetrovic@outlook.com'
license 'All Rights Reserved'
description 'Installs/Configures nginx-test'
long_description 'Installs/Configures nginx-test'
version '0.1.7'
chef_version '>= 13.0'

depends 'apt', '~> 7.1.1'
depends 'nginx', '~> 9.0.0'
depends 'firewall', '~> 2.6.5'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/nginx-test/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/nginx-test'
