#
# Author::  Eisuke Kozu (<eisuke@c-styles.jp>)
# Cookbook Name:: centos7-develop
# Recipe:: sshd
#
# Copyright 2015-2015, c-styles
#

include_recipe 'firewall'

# enable platform default firewall
firewall 'default' do
  enabled_zone :dmz
  action :save
end
