# vagrant-rails-heroku

A minimal(ish) VirtualBox-based Vagrant VM for developing/deploying Rails apps on Heroku.

*Copyright (C) 2018 W. W. Mason*
*(See License section below and LICENSE file)*


## Box Configuration
This box is based on `ubuntu/xenial64` (https://app.vagrantup.com/ubuntu/boxes/xenial64).
It adds the following packages/tools:
- Git
- rbenv
- ruby-build
- Ruby
- Bundler
- Node.js (a Rails dependency)
- Rails
- PostgreSQL
- Heroku CLI (formerly Heroku Toolkit)


## Getting Started
*Vagrant must be installed (https://www.vagrantup.com)*

Simply `vagrant up` in the directory containing both `Vagrantfile` and `bootstrap.sh`.

This has also been packaged into a base box, available at https://app.vagrantup.com/derstander/boxes/rails-heroku-dev

After the virtual machine is running, you may use `heroku login`.  You
can test this box with Heroku's `ruby-getting-started` sample
application (https://github.com/heroku/ruby-getting-started).  The
only change that should be made is in the Gemfile:
`ruby '2.3.x'` -> `ruby '2.5.0'`.


## Packaging as a Base Box
In the event of major changes to `ubuntu/xenial64`, this box can be
updated and repackaged for distribution via Vagrant Cloud.

To repackage as a base box, follow the process in [0]:
- `vagrant up`
- `vagrant ssh`
- `sudo apt-get update`
- `sudo apt-get upgrade`
- `sudo apt-get clean`
- `sudo dd if=/dev/zero of=/EMPTY bs=1M`
- `sudo rm -f /EMPTY`
- `cat /dev/null > ~/.bash_history && history -c && exit`
- `vagrant package --output rails-heroku-dev.box`
- Upload to Vagrant Cloud

*Note: I've had difficulty with the `sudo dd...` command -- running
out of memory; I have not further explored that.*

[0] https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one


## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
