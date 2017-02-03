#
# Cookbook Name:: weather-homework
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end

cookbook_file "/etc/nginx/conf.d/proxy.conf" do
  source "proxy.conf"
  mode "0644"
end

include_recipe 'sysctl::default'

sysctl_param 'net.ipv4.ip_local_port_range' do
  value '20000 64000'
end
