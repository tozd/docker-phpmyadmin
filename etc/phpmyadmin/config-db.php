<?php
##
## database access settings in php format
## automatically generated from /etc/dbconfig-common/phpmyadmin.conf
## by /usr/sbin/dbconfig-generate-include
## Mon, 07 Jul 2014 00:01:25 -0700
##
## by default this file is managed via ucf, so you shouldn't have to
## worry about manual changes being silently discarded.  *however*,
## you'll probably also want to edit the configuration file mentioned
## above too.
##
$dbuser='';
$dbpass='';
$basepath='';
$dbname='';
$dbserver=getenv('PHPMYADMIN_DBSERVER', true) ?: 'mysql';
$dbport=getenv('PHPMYADMIN_DBPORT', true) ?: '3306';
$dbtype='mysql';
