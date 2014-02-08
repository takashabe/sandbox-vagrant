#
# Cookbook Name:: playframework
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'timezone change' do
  user 'root'
  code <<-EOF
    rm -f /etc/localtime
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
  EOF
end

service 'iptables' do
  action :stop
end

['java-1.7.0-openjdk', 'java-1.7.0-openjdk-devel', 'git', 'unzip'].each do |pkg|
  yum_package pkg do
    action :install
  end
end

# playframework attributes
play_source_dir = node['play']['dir']
play_file_name  = "play-#{node['play']['version']}.zip"
source_url = "http://downloads.typesafe.com/play/#{node['play']['version']}/play-#{node['play']['version']}.zip"
play_owner = node['play']['user']
play_group = node['play']['group']

# play install dir
directory node['play']['dir'] do
  owner  play_owner
  group  play_group
  mode   "0775"
  action :create
end

# Install play
remote_file "#{play_source_dir}/#{play_file_name}" do
  source source_url
  mode "0644"
  not_if { File.exist?"#{play_source_dir}/#{play_file_name}" }
end

bash "unzip play zip" do
  user 'root'
  cwd play_source_dir
  code <<-EOH
    unzip #{play_source_dir}/#{play_file_name}
    mv #{play_source_dir}/play-#{node['play']['version']} /usr/local/bin
    chown -R sandbox:sandbox /usr/local/bin/play-#{node['play']['version']}
    ln -s /usr/local/bin/play-#{node['play']['version']}/play /usr/bin/play
  EOH
  not_if "which play"
end
