#!/data/data/com.termux/files/usr/bin/bash
cd /data/data/com.termux/files/home/
python3 update_index.py
cd Akasha
git add .
git commit -m "Temple update: $(date)"
git push origin main
termux-toast "Temple Updated Locally & to GitHub"
