#!/bin/bash

# This has to be run from master
git checkout dev

# Update our list of remotes
git fetch
git remote prune origin

# Remove local fully merged branches
git branch --merged dev | grep -v 'master$' | xargs git branch -d

# Show remote fully merged branches
echo "The following remote branches are fully merged and will be removed:"
git branch -r --merged dev | sed 's/ *origin\///' | grep -v 'master$' | grep -v 'release' | grep -v 'dev'

read -p "Continue (y/n)? "
if [ "$REPLY" == "y" ]
then
   # Remove remote fully merged branches
   git branch -r --merged master | sed 's/ *origin\///' \
             | grep -v 'master$' | grep -v 'release' | grep -v 'dev' | xargs -I% git push origin ":%"
   echo "Done!"
fi

#git branch -r --merged INTEGRATION | sed 's/ *origin\///' | grep -v 'INTEGRATION$' | grep -v 'release*' | grep -v 'sprint\-' | grep -v 'QA'