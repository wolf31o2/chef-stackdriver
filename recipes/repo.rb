#
# Cookbook Name:: stackdriver
# Recipe:: repo
# License:: MIT License
#
# Copyright 2013, StackDriver
#
# All rights reserved
#

case node['platform_family']
when 'debian'
  include_recipe 'apt'
  apt_repository 'stackdriver' do
    uri node['stackdriver']['apt_repo_url']
    distribution node['lsb']['codename']
    components 'main'
    action :add
    arch 'amd64'
    key node['stackdriver']['apt_gpgkey_url']
  end
when 'rhel', 'amazon' # ~FC024
  include_recipe 'yum'
  yum_repository 'stackdriver' do
    description 'Stackdriver Agent Repository'
    url node['stackdriver']['yum_repo_url']
    gpgkey node['stackdriver']['yum_gpgkey_url']
    gpgcheck true
    action :add
  end
end
