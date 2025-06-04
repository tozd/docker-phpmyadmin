# tozd/phpmyadmin

<https://gitlab.com/tozd/docker/phpmyadmin>

Available as:

- [`tozd/phpmyadmin`](https://hub.docker.com/r/tozd/phpmyadmin)
- [`registry.gitlab.com/tozd/docker/phpmyadmin`](https://gitlab.com/tozd/docker/phpmyadmin/container_registry)

## Image inheritance

[`tozd/base`](https://gitlab.com/tozd/docker/base) ← [`tozd/dinit`](https://gitlab.com/tozd/docker/dinit) ← [`tozd/nginx`](https://gitlab.com/tozd/docker/nginx) ← [`tozd/nginx-mailer`](https://gitlab.com/tozd/docker/nginx-mailer) ← [`tozd/nginx-cron`](https://gitlab.com/tozd/docker/nginx-cron) ← [`tozd/php`](https://gitlab.com/tozd/docker/php) ← `tozd/phpmyadmin`

## Tags

- `latest`: phpMyAdmin v5.2.1

## Variables

- `PHPMYADMIN_HOST`: Hostname of the database to connect to., Default is `mysql`.
- `PHPMYADMIN_PORT`: Port of the database to connect to. Default is 3306.

## Description

Image provides [phpMyAdmin](https://www.phpmyadmin.net/).
When the container runs phpMyAdmin is available at `/phpmyadmin/` URL.

By default it is intended to be used for a installation-wide web admin where each user sees databases they have access to, but you can configure it differently, too (you can mount a
volume or extend the image to add `.php` configuration files to `/etc/phpmyadmin/conf.d`).

To configure to which database to connect use environment variables.

You should add `blowfish_secret.inc.php` file to `/etc/phpmyadmin/conf.d` with contents like:

```php
<?php
$cfg['blowfish_secret'] = 'at least 32 random characters secret';
```

Without the file, pypMyAdmin will use one baked and shared in the Docker image.

## GitHub mirror

There is also a [read-only GitHub mirror available](https://github.com/tozd/docker-phmygadmin),
if you need to fork the project there.
