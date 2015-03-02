#!/bin/sh

apt-get update \
&& apt-get -y install python-software-properties \
&& apt-add-repository -y ppa:ansible/ansible \
&& apt-get update \
&& apt-get -y install ansible \
&& ansible-playbook /vagrant/provision/ansible/site.yml
