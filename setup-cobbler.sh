#!/bin/bash

# Update APT cache at most once every six hours
PKG_CACHE="/var/cache/apt/pkgcache.bin"
if [ ! -f "$PKG_CACHE" ]
then
  apt-get update
else
  PKG_CACHE_AGE=$(($(date +%s) - $(date +%s -r "$PKG_CACHE")))
  if [ $PKG_CACHE_AGE -gt 21600 ]
  then
    apt-get update
  fi
fi

# Install Chef client
if [ ! -f "chef.deb" ]
then
  wget -O chef.deb -nv http://192.168.121.1/chef_12.8.1-1_amd64.deb
fi
dpkg-query -l chef >/dev/null 2>&1
if [ "$?" != "0" ]
then
  DEBIAN_FRONTEND=noninteractive dpkg -i chef.deb
fi

# Continue installation via chef-solo
cd /vagrant/chef/cobbler
chef-solo -c solo.rb
