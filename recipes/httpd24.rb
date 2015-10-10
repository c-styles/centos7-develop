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
httpd_module 'socache_shmcb' do
  action :create
end


# 自己証明書作成
# TODO Vagrantだけに限定すべき
directory "etc/httpd-default/ssl" do
  owner "root"
  group "root"
  recursive true
  mode 0755
  action :create
end
openssl_x509 '/etc/httpd-default/ssl/mycert.pem' do
  common_name '192.168.33.100'
  org 'Foo Bar'
  org_unit 'Lab'
  country 'JP'
end

httpd_config 'https' do
  source 'ssl.conf.erb'
  variables node['httpd24']['configs']
  notifies :restart, 'httpd_service[default]'
  action :create
end


httpd_module 'php' do
  httpd_version '2.4'
  package_name 'php56u'
  action :create
end
