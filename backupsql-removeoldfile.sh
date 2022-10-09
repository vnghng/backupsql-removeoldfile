#!/bin/bash
path="/home/vagrant/db_backups/"
timestamp=$(date +%Y%m%d_%H%M%S)
filename=log_$timestamp.txt
log=$path$filename 
scp -r vagrant@192.168.33.27:/home/vagrant/db_backups /home/vagrant
START_TIME=$(date +%s)
find /home/vagrant/db_backups/* -maxdepth 1  -type d -ctime +3 -print -exec rm -rf {} \; >> $log
echo "Backup::Script Start -- $(date +%Y%m%d_%H%M)" >> $log
END_TIME=$(date +%s)
ELAPSED_TIME=$(( $END_TIME - $START_TIME ))
echo "Script End -- $(date +%Y%m%d_%H%M)" >> $log
echo "Elapsed Time ::  $(date -d 00:00:$ELAPSED_TIME +%Hh:%Mm:%Ss) "  >> $log
