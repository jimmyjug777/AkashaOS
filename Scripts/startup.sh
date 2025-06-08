#!/data/data/com.termux/files/usr/bin/bash
# startup.sh - runs git pull and runs tasker commands

cd ~/yourrepo || exit
git pull origin main

# Example: trigger Tasker CLI command if you use termux:tasker
termux-tasker --run MyTaskerProfile

echo "Startup tasks complete."