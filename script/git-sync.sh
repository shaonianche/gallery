#!/usr/bin/env bash

set -e

git_root=$(git rev-parse --show-toplevel 2> /dev/null)

if [[ $? -eq 0 ]]; then
    cd "$git_root"
    rm -rf .git
    git init --initial-branch=master \
		&& git remote add origin "https://github.com/shaonianche/gallery.git" \
		&& git add -A  \
		&& git remote -v \
		&& git commit -m "refresh everything" \
		&& git push -f --set-upstream origin master
else
    echo "error: not found .git"
fi
