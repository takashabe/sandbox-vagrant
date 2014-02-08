#
# Cookbook Name:: app-rakugaki
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/home/sandbox/rakugaki" do
  repository node[:rakugaki][:remote_url]
  reference  node[:rakugaki][:revision]
  user       node[:rakugaki][:user]
  action     :checkout
end
