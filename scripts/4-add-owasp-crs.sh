#!/bin/bash

set -e # Stop script on error

echo "Adding OWASP CRS"
# Create directory to store rules
mkdir /etc/nginx/modsec
cd /etc/nginx/modsec

# Dowload the ruleset
wget https://github.com/SpiderLabs/owasp-modsecurity-crs/archive/v3.0.2.tar.gz
tar -xzvf v3.0.2.tar.gz

# Create a crs-setup.conf file
mv /etc/nginx/modsec/owasp-modsecurity-crs-3.0.2/crs-setup.conf.example /etc/nginx/modsec/owasp-modsecurity-crs-3.0.2/crs-setup.conf
