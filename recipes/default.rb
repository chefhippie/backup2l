#
# Cookbook Name:: backup2l
# Recipe:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de> Programmierung
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node["backup2l"]["packages"].each do |pkg|
  package pkg do
    action :install
  end
end

file node["backup2l"]["system_cron"] do
  action :delete
end

directory node["backup2l"]["target"] do
  owner "root"
  group "root"
  mode "0755"
  recursive true

  action :create
end

template node["backup2l"]["config_file"] do
  source "backup2l.conf.erb"
  owner "root"
  group "root"
  mode 0640

  variables(
    node["backup2l"]
  )
end

cron "backup" do
  minute node["backup2l"]["cron"]["minute"]
  hour node["backup2l"]["cron"]["hour"]
  day node["backup2l"]["cron"]["day"]
  month node["backup2l"]["cron"]["month"]
  weekday node["backup2l"]["cron"]["weekday"]

  command "nice -n 20 backup2l -b > /dev/null"
end

template "/usr/local/sbin/backupftp" do
  source "backupftp.erb"
  owner "root"
  group "root"
  mode 0740

  if Chef::Config[:solo] and not node.recipes.include?("chef-solo-search")
    variables(
      node["backup2l"].merge(
        node["backup2l"]["credentials"]
      )
    )
  else
    variables(
      node["backup2l"].merge(
        search(
          node["backup2l"]["data_bag"],
          "fqdn:#{node["fqdn"]} OR id:default"
        ).first.to_hash
      )
    )
  end
end
