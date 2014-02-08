#
# Cookbook Name:: sandbox
# Recipe:: default
#
# Copyright 2014, @takashabe
#
# All rights reserved - Do Not Redistribute
#

# Initialize app user
user 'sandbox' do
  comment   'sandbox user'
  uid       599
  password  'sandbox'
  supports  :manage_home => true
  action    [:create, :manage]
end
