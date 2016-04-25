#!/bin/bash

# Setup paths
LOCALWIKI=~/Workspace/FreeCodeCamp.wiki
REMOTE="upstream"
BRANCH="master"
echo "Fork Reset v1"
echo
echo "Move to Local Wiki directory at " + $LOCALWIKI
cd $LOCALWIKI
echo
echo "Sync fork..."
git fetch $REMOTE
git reset --hard $REMOTE/$BRANCH
git push -f origin $BRANCH
echo "Done!"
echo