#!/bin/bash
user=$(whoami)
rsync -aESzv --progress --delete -e 'ssh' --exclude-from /home/$user/dotfiles/backup/rsync_exclude.txt /home/$user/ backup:~/tp_backup_$user
