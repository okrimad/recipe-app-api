#!/bin/sh

set -e

# Environment substitute
# Substitute all VARs ${VAR} in template file,
# by the ENV VARs with the matching names
# and paste the result to the file after >
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
# Start Nginx to run in the foreground
nginx -g 'daemon off;'
