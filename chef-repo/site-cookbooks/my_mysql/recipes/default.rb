#
# Cookbook Name:: my_mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'mysql::server'
include_recipe 'database::mysql'

service "mysqld" do
  supports:status=>true, :restart=>true, :reload=>true
  action [:enable, :start]
end

mysql_connection_info = {
  host: 'localhost',
  username: 'root',
  password: node['mysql']['server_root_password'],
}

mysql_database 'sandbox_db' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'sandbox' do
  connection mysql_connection_info
  password   node['mysql']['app_user_password']
  action     [:create, :grant]
end
