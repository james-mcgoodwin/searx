#!/usr/bin/env bash

set -x
cat <<MEOW >/tmp/searx_update_commands.sh
#!/usr/bin/env bash
. ./searx-ve/bin/activate
git stash
git fetch upstream
git checkout yennix
git pull origin yennix
git merge upstream/master
git stash apply
./manage.sh update_packages
MEOW
sudo chmod 755 /tmp/searx_update_commands.sh
cd /usr/local/searx
sudo -u searx -i /tmp/searx_update_commands.sh
sudo service uwsgi restart
rm /tmp/searx_update_commands.sh
