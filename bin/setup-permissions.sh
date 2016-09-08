#!/bin/bash

owd=`pwd`
user=$SUDO_USER;

sudo -i -u ${user} bash -c "npm config set prefix /usr/local";
mkdir -p /usr/local/lib/node_modules;
chown -R ${user} /usr/local/bin /usr/local/lib/node_modules /usr/local/share;

cd ${owd}
