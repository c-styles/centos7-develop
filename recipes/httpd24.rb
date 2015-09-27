#
# Author::  Eisuke Kozu (<eisuke@c-styles.jp>)
# Cookbook Name:: centos7-develop
# Recipe:: httpd24
#
# Copyright 2015-2015, c-styles
#

httpd_service 'default' do
  action [:create, :start]
end
