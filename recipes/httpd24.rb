#
# Author::  Eisuke Kozu (<eisuke@c-styles.jp>)
# Cookbook Name:: centos7-develop
# Recipe:: httpd24
#
# Copyright 2015-2015, c-styles
#

httpd_service 'default' do
  version '2.4'
  mpm 'prefork'
  listen_ports ['80', '443']
  action [:create, :start]
end

httpd_config 'http' do
  source 'http.conf.erb'
  variables node['httpd24']['configs']
  notifies :restart, 'httpd_service[default]'
  action :create
end

httpd_module 'ssl' do
  action :create
end


httpd_module 'php' do
  httpd_version '2.4'
  package_name 'php56u'
  action :create
end
