FROM cloyne/php

# We want to enable configuration even if dbname is empty,
# because we do not want to set dbname because then we need
# a special database for phpMyAdmin for advanced features.

RUN apt-get update -q -q && \
 apt-get install phpmyadmin --yes --force-yes && \
 sed -i 's/!empty(\$dbname)/TRUE/' /etc/phpmyadmin/config.inc.php && \
 chown -Rh :fcgi-php /var/lib/phpmyadmin && \
 chown -Rh fcgi-php /var/lib/phpmyadmin/tmp

COPY ./patches patches

RUN \
 apt-get install patch --yes --force-yes && \
 for patch in patches/*; do patch --prefix=./patches/ -p0 --force "--input=$patch" || exit 1; done && \
 rm -rf patches && \
 apt-get purge patch --yes --force-yes && \
 apt-get autoremove --yes --force-yes

COPY ./etc /etc
