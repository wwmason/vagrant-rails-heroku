#!/usr/bin/env bash

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


# Install fundamental tools
echo 'Installing fundamental tools'
sudo apt-get update
sudo apt-get install -y git-core gcc make libssl-dev libreadline-dev zlib1g-dev

# Install rbenv
echo 'Installing rbenv'
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install ruby-build
echo 'Installing ruby-build'
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install Ruby
echo 'Installing ruby'
sudo -H -u vagrant bash -i -c 'rbenv install 2.5.0'
sudo -H -u vagrant bash -i -c 'rbenv global 2.5.0'

# Install Bundler
echo 'Bundler'
sudo -H -u vagrant bash -i -c 'gem install bundler'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

# Install NodeJS
echo 'Installing NodeJS'
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Rails
echo 'Installing Rails'
sudo -H -u vagrant bash -i -c 'gem install rails -v 5.1.4'
sudo -H -u vagrant bash -i -c 'rbenv rehash'

# Install PostgreSQL
echo 'Installing PostgreSQL'
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev

# Set up PostgreSQL default user
# username = dbuser
# password = <none>
# ! NOTE ! Without a password for the database user
# it's inadvisable to expose this VM to the outside world
sudo -u postgres createuser vagrant -s

# Set up Heroku Toolbelt
sudo snap install heroku --classic
