#!/bin/bash

# substitute environment variables
echo Substituting environment variables
envsubst < /etc/nginx/conf.d/reverse_proxy.conf.template > /etc/nginx/conf.d/reverse_proxy.conf
rm /etc/nginx/conf.d/reverse_proxy.conf.template

# generate .htpasswd file
echo Generating htpasswd file
htpasswd -cb /etc/nginx/conf.d/.htpasswd ${BASIC_USERNAME} ${BASIC_PASSWORD}

# start nginx
echo Starting nginx
exec nginx -g 'daemon off;'
