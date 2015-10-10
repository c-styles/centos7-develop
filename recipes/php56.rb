#
# Author::  Eisuke Kozu (<eisuke@c-styles.jp>)
# Cookbook Name:: centos7-develop
# Recipe:: php56
#
# Copyright 2015-2015, c-styles
#

# デフォルトのPHPをすべて削除したいだけだが、美しくない…
script "remove_default_php" do
  only_if "rpm -qa|grep 'php-'"
  ignore_failure true
  interpreter "bash"
  user        "root"
  code <<-EOL
    yum remove -y php-*
  EOL
end

include_recipe "php"
