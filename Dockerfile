FROM cloyne/php

MAINTAINER Mitar <mitar.docker@tnode.com>

# We want to enable configuration even if dbname is empty,
# because we do not want to set dbname because then we need
# a special database for phpMyAdmin for advanced features

RUN apt-get update -q -q && \
 apt-get install phpmyadmin --yes --force-yes && \
 sed -i 's/!empty(\$dbname)/TRUE/' /etc/phpmyadmin/config.inc.php

COPY ./etc /etc
