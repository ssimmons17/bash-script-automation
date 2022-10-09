#! /bin/bash

while true; do

#IP address of remote server
remote_server="192.168.1.197"


#Source location
echo "Please provide source file location: "

read source_location

#rsync command will perform dry-run to make sure correct files are copied
rsync -avrhp --dry-run $source_location "pi@$remote_server:/home/pi/Music_Storage"

echo "Would you like to copy these files? Enter 'y' or 'n': "

read response

#Conditional statements -y to copy file; -n to quit; else-check for invalid values
  if [ "$response" = "y" ]; then
	rsync -avrhp $source_location "pi@$remote_server:/home/pi/Music_Storage"
        break

  elif [ "$response" = "n" ]; then
   echo "Please readjust your criteria and try again"

  else
    echo "Invalid value: please enter 'y' or 'n' to proceed."
  fi
  
done
