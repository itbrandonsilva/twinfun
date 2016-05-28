#!/bin/bash

owd=`pwd`
user=`logname`;

# Setup node
node_version="v6.2.0";
node_folder="node-${node_version}-linux-x64";
node_tar="${node_folder}.tar.gz";
cd /usr/local/bin;
wget -q -O - "https://nodejs.org/dist/${node_version}/${node_tar}" | tar zxf -;
ln -s "${node_folder}/bin/node";
ln -s "${node_folder}/bin/npm";
sudo -i -u ${user} bash -c "npm config set prefix /usr/local";
mkdir -p /usr/local/lib/node_modules;
chown -R ${user} /usr/local/bin /usr/local/lib/node_modules /usr/local/share;

cd ${owd}
