FROM registry.gitlab.com/tozd/docker/php:8.3

ENV PHPMYADMIN_HOST=mysql
ENV PHPMYADMIN_PORT=3306

VOLUME /etc/phpmyadmin/conf.d

# We want to enable configuration even if dbname is empty,
# because we do not want to set dbname because then we need
# a special database for phpMyAdmin for advanced features.
RUN apt-get update -q -q && \
  apt-get install phpmyadmin --yes --force-yes && \
  sed -i 's/!empty(\$dbname)/TRUE/' /etc/phpmyadmin/config.inc.php && \
  chown -Rh :fcgi-php /var/lib/phpmyadmin && \
  chown -Rh fcgi-php /var/lib/phpmyadmin/tmp && \
  for file in /etc/php/8.3/mods-available/*.ini; do phpenmod $(basename -s .ini "$file"); done && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache ~/.npm

COPY ./etc /etc
