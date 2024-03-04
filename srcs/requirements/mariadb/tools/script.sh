#!/bin/bash

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS $db_name ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
