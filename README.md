# tozd/phpmyadmin

<https://gitlab.com/tozd/docker/phpmyadmin>

Available as:

- [`tozd/phpmyadmin`](https://hub.docker.com/r/tozd/phpmyadmin)
- [`registry.gitlab.com/tozd/docker/phpmyadmin`](https://gitlab.com/tozd/docker/phpmyadmin/container_registry)

## Description

Image extending [tozd/php](https://gitlab.com/tozd/docker/php) image with [phpMyAdmin](https://www.phpmyadmin.net/).
By default It is intended to be used for a installation-wide web admin where each user sees databases they have access to, but you can configure it differently, too.

To configure to which database to connect, use environment variables:

- `PHPMYADMIN_HOST` – hostname of the database, default `mysql`
- `PHPMYADMIN_PORT` – port of the database, default `3306`

You can also mount a `/etc/phpmyadmin/conf.d` volume with additional `.php` configuration files.
One of such file should be a `blowfish_secret.inc.php` file with contents like:

```php
<?php
$cfg['blowfish_secret'] = 'at least 32 random characters secret';
```

Without the file, pypMyAdmin will use one baked and shared in the Docker image.
