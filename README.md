Image extending [tozd/php](https://github.com/tozd/docker-php) image with [phpMyAdmin](https://www.phpmyadmin.net/).

To configure to which database to connect, use environment variables:
* `PHPMYADMIN_DBSERVER` – hostname of the database, default `mysql`
* `PHPMYADMIN_DBPORT` – port of the database, default `3306`
