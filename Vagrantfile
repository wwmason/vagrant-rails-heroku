# -*- mode: ruby -*-
# vi: set ft=ruby :

# A VirtualBox-based Vagrant VM for Rails development; geared toward hosting the end-product on Heroku
# Copyright (C) 2018 W. W. Mason
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "/Users/bill/Documents/workspace/ror", "/home/vagrant/workspace"
  config.vm.provision :shell, privileged: false, path: "bootstrap.sh"
  config.vm.network "forwarded_port", guest: 5000, host: 5000, host_ip: "127.0.0.1"
end
