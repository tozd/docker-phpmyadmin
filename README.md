# tozd/phpmyadmin

<https://gitlab.com/tozd/docker/phpmyadmin>

Available as:

* [`tozd/phpmyadmin`](https://hub.docker.com/r/tozd/phpmyadmin)
* [`registry.gitlab.com/tozd/docker/phpmyadmin`](https://gitlab.com/tozd/docker/phpmyadmin/container_registry)

## Description

Image extending [tozd/php](https://gitlab.com/tozd/docker/php) image with [phpMyAdmin](https://www.phpmyadmin.net/).
It is intended to be used for a installation-wide web admin where each user sees databases they have access to.

To configure to which database to connect, use environment variables:

* `PHPMYADMIN_DBSERVER` – hostname of the database, default `mysql`
* `PHPMYADMIN_DBPORT` – port of the database, default `3306`


