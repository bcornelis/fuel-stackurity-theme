#!/bin/bash

# create the required directories
mkdir -p /usr/share/openstack-dashboard/openstack_dashboard/themes/stackurity/static/img

# copy the logo files
cp logos/*.png /usr/share/openstack-dashboard/openstack_dashboard/themes/stackurity/static/img
cp logos/favicon.ico /usr/share/openstack-dashboard/openstack_dashboard/themes/stackurity/static/img

# create the file to overwrite the themes
echo "AVAILABLE_THEMES = [('stackurity', 'Stackurity', 'themes/stackurity')]" > /usr/share/openstack-dashboard/openstack_dashboard/local/local_settings.d/_11_set_default_theme.py

# recompile
/usr/share/openstack-dashboard/manage.py compress --force 
/usr/share/openstack-dashboard/manage.py collectstatic --noinput 

# and reload apache
service apache2 reload
