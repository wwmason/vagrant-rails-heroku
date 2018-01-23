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
  
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # !!!
  # I anticipate needing to create a forwarded port mapping later, so I'll
  # leave the above two comments intact.  I may as well use the latter to
  # prevent public access.
  # !!!

end
