#/bin/bash -e

mkdir -p /srv/var/log/phpmyadmin

# TODO: We should not trust whole Docker IP range

docker run -d --restart=always --name phpmyadmin --hostname phpmyadmin -e SET_REAL_IP_FROM=172.17.0.0/16 -e ADMINADDR=root@cloyne.org -e REMOTES=mail.cloyne.net -v /srv/var/hosts:/etc/hosts:ro -v /srv/var/log/phpmyadmin:/var/log/nginx cloyne/phpmyadmin
