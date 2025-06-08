#!/data/data/com.termux/files/usr/bin/bash

LOGFILE=$HOME/akasha_sync.log
echo "---- Sync started: $(date) ----" >> $LOGFILE

# Rclone sync
rclone sync mydrive:/AkashaOS $HOME/AkashaOSCloud \
  --log-file=$HOME/rclone_rsync.log \
  --log-level=INFO \
  >> $LOGFILE 2>&1

# Git push only if needed
cd $HOME/AkashaOSCloud
if ! git diff --quiet; then
  git add .
  git commit -m "Auto-sync $(date)" >> $LOGFILE 2>&1
  git push origin main >> $LOGFILE 2>&1
else
  echo "No changes to commit." >> $LOGFILE
fi

echo "---- Sync completed: $(date) ----" >> $LOGFILE

