# Overview
Simple non-root wordpress setup with prepared content.

# Use cases
This setup can be used to test persistence:
- Disk (MariaDB)
- Files (multiple front ends)




# Reference only
# Retain Wordpress setup and content
Source: https://blog.tawfiq.me/how-to-quickly-increase-the-all-in-one-wp-migration-plugin-upload-limit/
- Delete current "All in one WP Migration" plugin
- Install version [6.77](https://blog.tawfiq.me/wp-content/uploads/2018/02/all-in-one-wp-migration.6.77.zip). Locally saved in the plugins folder.
- 
- 

wp plugin install all-in-one-wp-migration --activate
# /bitnami/wordpress/wp-content/plugins/all-in-one-wp-migration/constants.php
tar zcvf wordpress-dev.backup.wpress.tar.gz wordpress-dev.backup.wpress

Docker
```
docker cp ./plugins/all-in-one-wp-migration.6.77.zip wordpress-non-root_wordpress-fe_1:/tmp/
docker exec wordpress-non-root_wordpress-fe_1 wp plugin delete all-in-one-wp-migration
docker exec wordpress-non-root_wordpress-fe_1 wp plugin install /tmp/all-in-one-wp-migration.6.77.zip --activate

wget -O backup.tar.gz --no-check-certificate --no-proxy http://crosslogic-consulting.s3.amazonaws.com/lab/wordpress-dev.backup.wpress.tar.gz
tar zxvf backup.tar.gz
cp $(ls *.wpress | head -1) wordpress-dev-20201130-162538-8bc2h7.wpress
cp $(ls *.wpress | head -1) 127.0.0.1-20201130-162538-8bc2h7.wpress
tar -cv 127.0.0.1-20201130-162538-8bc2h7.wpress | docker exec -i wordpress-non-root_wordpress-fe_1 tar x -C /tmp/
docker exec wordpress-non-root_wordpress-fe_1 wp ai1wm restore /tmp/127.0.0.1-20201130-162538-8bc2h7.wpress
wp rewrite flush
wp rewrite flush