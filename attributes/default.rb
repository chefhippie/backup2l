#
# Cookbook Name:: backup2l
# Attributes:: default
#
# Copyright 2013, Thomas Boerger Programmierung
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

default["backup2l"]["packages"] = %w(
  backup2l
  ncftp
)

default["backup2l"]["sources"] = %w(
  /backup
  /etc
  /home
  /root
)

default["backup2l"]["config_file"] = "/etc/backup2l.conf"
default["backup2l"]["system_cron"] = "/etc/cron.daily/zz-backup2l"
default["backup2l"]["target"] = "/var/backup.d/final"
default["backup2l"]["skip"] = "-false"
default["backup2l"]["max_level"] = 4
default["backup2l"]["max_per_level"] = 6
default["backup2l"]["max_full"] = 4
default["backup2l"]["generations"] = 1
default["backup2l"]["data_bag"] = "backup2l"

default["backup2l"]["cron"]["minute"] = 0
default["backup2l"]["cron"]["hour"] = 6
default["backup2l"]["cron"]["day"] = "*"
default["backup2l"]["cron"]["month"] = "*"
default["backup2l"]["cron"]["weekday"] = "*"

default["mysql"]["credentials"]["username"] = "root"
default["mysql"]["credentials"]["password"] = "root"
default["mysql"]["credentials"]["directory"] = "/"
default["mysql"]["credentials"]["server"] = "localhost"
