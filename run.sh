#/bin/bash -e

mkdir -p /srv/var/log/phpmyadmin

# TODO: We should not trust whole Docker IP range.

docker run --detach=true --restart=always --name phpmyadmin --hostname phpmyadmin \
 --env VIRTUAL_HOST=cloyne.org --env VIRTUAL_ALIAS=/phpmyadmin/ \
 --env SET_REAL_IP_FROM=172.17.0.0/16 --env ADMINADDR=root@cloyne.org --env REMOTES=mail.cloyne.net \
 --volume /srv/var/log/phpmyadmin:/var/log/nginx \
 tozd/phpmyadmin
