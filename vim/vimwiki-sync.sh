#!/bin/bash
cd ~/Documents/wiki
if [ ! -z "$(git status --porcelain)" ]; then 
    # Uncommitted changes
    git add .
    git commit -m $(date +"%d/%m/%Y %H:%M")
    git push
fi
