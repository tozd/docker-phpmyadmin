FROM tozd/php:7.2

ENV PHPMYADMIN_DBSERVER mysql
ENV PHPMYADMIN_DBPORT 3306

# We want to enable configuration even if dbname is empty,
# because we do not want to set dbname because then we need
# a special database for phpMyAdmin for advanced features.

RUN apt-get update -q -q && \
 apt-get install phpmyadmin php7.2-mbstring --yes && \
 sed -i 's/!empty(\$dbname)/TRUE/' /etc/phpmyadmin/config.inc.php && \
 chown -Rh :fcgi-php /var/lib/phpmyadmin && \
 chown -Rh fcgi-php /var/lib/phpmyadmin/tmp && \
 for file in /etc/php/7.2/mods-available/*.ini; do phpenmod $(basename -s .ini "$file"); done

COPY ./etc /etc
