# Vagrant Environent

## OS & Middleware
* ubuntu 14.04
* MySQL 5.6.1
* PHP 5.5
* nginx + php5-fpm
* Ruby 2.2 w/ rbenv & ruby-build

# Requirement
* ChefDK
```sh
https://downloads.getchef.com/chef-dk/
```

* vagrant-omnibus
```sh
% vagrant plugin install vagrant-omnibus
```

# Command
```sh
% berks install
% vagrant up
```

# Synced Docroot Directory
docroot is the document root directory of nginx + php5-fpm.
