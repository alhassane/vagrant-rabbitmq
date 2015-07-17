#!/bin/bash

sudo chmod -R +x /vagrant

echo "*** install pc ***"
/vagrant/provisioners/shell/pc/installer-pc.sh

echo "*** install jenkins plugins ***"
/vagrant/provisioners/shell/rabbitmq/installer-rabbitmq.sh