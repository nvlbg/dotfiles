#!/bin/sh
[ -x ~/.ssh-agent-thing ] && source ~/.ssh-agent-thing
cd ~/Documents/wiki
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo 'Syncing...'
date

if [ ! -z "$(git status --porcelain)" ]; then 
    # Uncommitted changes
    git add .
    git commit -m "$(date +"%d/%m/%Y %H:%M")"
    git push origin "${CURRENT_BRANCH}"
fi

# Pull changes
git pull origin master

if git merge master; then
    # Update master
    git checkout master
    git merge "${CURRENT_BRANCH}"
    git push origin master
    git push origin "${CURRENT_BRANCH}"
    git checkout "${CURRENT_BRANCH}"
else
    # Merge conflict
    git merge --abort
    git checkout "${CURRENT_BRANCH}"
fi
