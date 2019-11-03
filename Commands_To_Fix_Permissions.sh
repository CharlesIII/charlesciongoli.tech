#!/bin/bash

# Main Folders
chown www-data:www-data admin
chmod 755 admin
chown www-data:www-data magento2
chmod 755 magento2
chown www-data:www-data mainsite
chmod 755 mainsite

# Magento
cd magento2
chown -R www-data:www-data .
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
find ./var -type d -exec chmod 777 {} \;
find ./pub/media -type d -exec chmod 777 {} \;
find ./pub/static -type d -exec chmod 777 {} \;
chmod 777 ./app/etc
chmod 644 ./app/etc/*.xml
chmod u+x bin/magento

# Go back
cd ..

# Wordpress
cd mainsite
chown -R www-data:www-data .
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;
chmod 600 wp-config.php
