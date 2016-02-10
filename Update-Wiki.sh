#!/bin/bash
#

if [ "$1" = "-h" ]; then
     echo "Script to update the local and live version of the FreeCodeCamp wiki"
     echo "Usage: Update-Wiki.sh full_path_to_config.sh "
     echo "Example ~/Desktop/config.sh"
     sleep 3
	 exit 0
elif [ "$1" = "-help" ]; then
     echo "Script to update the local and live version of the FreeCodeCamp wiki"
     echo "Usage: Update-Wiki.sh full_path_to_config.sh "
     echo "Example ~/Desktop/config.sh"
     sleep 3
	 exit 0
elif [ "$1" = "" ]; then
     echo "Undefined parameters"
     echo "Usage: Update-Wiki.sh full_path_to_config.sh "
     echo "Example ~/Desktop/config.sh"
     sleep 3
	 exit 1
fi
configPath=$1

source $configPath

function exit {
  exit
}

function p {
  echo $1
}

function update {
  git pull
}

function status {
  git status
}

function commit {
  cd $1
  git add .
  git rm .
  git commit -m $2
  p Done!
}

function updateLive {
  cd $1
  git fetch $2
  git pull $2 $3
  git push
  p Done!
}

function push {
  git push
}

echo "FreeCodeCamp Wiki updater v1"
echo
echo "Move to Local Wiki directory at " + $workspace$local_wiki
cd $workspace$local_wiki
echo
echo "Updating local repository..."
update
status
echo
p Done!
echo "Going to the live Wiki ..."
cd $workspace$live_wiki
echo
echo "Update live wiki..."
updateLive $workspace$live_wiki $up $down
status
echo

commit $workspace/FCC-Wiki-Scripts $message
p "Testign a couple of things."
# Keep the windows Open until I press a key
echo "Press any key to close this windows..."
#read -n 1 -s
sleep 5
exit 0