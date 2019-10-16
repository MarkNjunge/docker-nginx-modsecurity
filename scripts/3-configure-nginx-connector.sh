#!/bin/bash

set -e # Stop script on error

echo "Downloading the NGINX Connector for ModSecurity and Compiling It as a Dynamic Module"
# Clone the GitHub repository
git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git

# Download the source code corresponding to the installed version of NGINX
wget http://nginx.org/download/nginx-1.14.0.tar.gz
tar zxvf nginx-1.14.0.tar.gz

# Compile the dynamic module and copy it to the standard directory for modules
cd nginx-1.14.0
./configure --with-compat --add-dynamic-module=../ModSecurity-nginx
make modules
cp objs/ngx_http_modsecurity_module.so /etc/nginx/modules
