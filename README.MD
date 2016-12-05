# Zurmo in Docker
[![N|Solid](http://zurmo.org/wp-content/themes/Zurmo/images/Zurmo-logo.png)](https://www.zurmo.org)
[![N|Solid](https://github.com/docker/docker/raw/master/docs/static_files/docker-logo-compressed.png)](https://www.docker.com)


A dockerfile for Zurmo CRM application.
Default username/password/databasename is zurmo
# How to run
```bash
docker run -itd -p 80:80 hxquangnhat/zurmo:latest
docker run --name mysql -itd -p 3306:3306 \
            -e MYSQL_ROOT_PASSWORD=admin \
            -e MYSQL_DATABASE=zurmo \
            -e MYSQL_USER=zurmo \
            -e MYSQL_PASSWORD=zurmo \
            mysql \
            --character-set-server=utf8 \
            --collation-server=utf8_unicode_ci \
            --default-storage-engine=INNODB \
            --max-sp-recursion-depth=100 \
            --max-allowed-packet=20M \
            --thread-stack=512K \
            --optimizer-search-depth=0 \
            --sql-mode="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
docker run -itd -p 11211:11211 memcached
```
Head to http://localhost/zurmo/ and start installing zurmo. DB host and memcached host should be IP address of your machine.
# Using docker-compose
A docker-compose file with:
- zurmo image
- mysql with zurmo configured
- memcached
```bash
docker-compose up
```
DB host is 'mysql' and memcached host is 'memcached'
