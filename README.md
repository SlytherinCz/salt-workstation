# Saltstack formulas for HP 650 on Ubuntu 16.04

## Requirements

* install salt-common and make on machine

  ``sudo wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -``

  ``sudo echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list``

  ``sudo apt-get install salt-common python-msgpack make``

## Running

* run salstack to provision system

  ``make salt_call``
