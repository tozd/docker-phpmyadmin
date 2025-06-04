FROM registry.gitlab.com/tozd/docker/php:8.3

ENV PHPMYADMIN_HOST=mysql
ENV PHPMYADMIN_PORT=3306

VOLUME /etc/phpmyadmin/conf.d

# We want to enable configuration even if dbname is empty,
# because we do not want to set dbname because then we need
# a special database for phpMyAdmin for advanced features.
RUN apt-get update -q -q && \
  apt-get install phpmyadmin && \
  php8.3-bz2 php8.3-cli php8.3-common php8.3-curl php8.3-mbstring php8.3-mcrypt php8.3-mysql && \
  php8.3-opcache php8.3-phpdbg php8.3-readline php8.3-xml php8.3-zip --yes --force-yes && \
  sed -i 's/!empty(\$dbname)/TRUE/' /etc/phpmyadmin/config.inc.php && \
  chown -Rh :fcgi-php /var/lib/phpmyadmin && \
  chown -Rh fcgi-php /var/lib/phpmyadmin/tmp && \
  for file in /etc/php/8.3/mods-available/*.ini; do phpenmod $(basename -s .ini "$file"); done && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc
