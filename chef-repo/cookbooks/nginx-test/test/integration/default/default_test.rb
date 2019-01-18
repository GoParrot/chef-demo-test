# # encoding: utf-8

# Inspec test for recipe nginx-test::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe package 'nginx' do
  it { should be_installed }
end

describe service 'nginx' do
  it { should be_enabled }
  it { should be_running }
end


# describe port(80) do
#   it { should be_listening }
#   its('protocols') { should include 'tcp' }
#   its('addresses') { should include '0.0.0.0' }
# end

# describe port(22) do
#   it { should be_listening }
#   its('processes') { should include 'sshd' }
#   its('protocols') { should include 'tcp' }
#   its('addresses') { should include '0.0.0.0' }
# end