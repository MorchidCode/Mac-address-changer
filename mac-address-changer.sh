#! /bin/bash

ORG_MAC= #Your original mac address
NEW_MAC= # Generate new one

# Make sure the the file executed superuser privileges.
if [[ ${UID} -eq 0 ]]
then
  # Ask the user if he wants to set original mac address or new one.
  read -p 'Which mac address do you want to set? choose "original" or "new": ' ANSEWR

  # Check the ansewr. if ansewr equal original, set original mac address. if the ansewr equal new, set new mac address. else exit with 1.
  if [[ ${ANSEWR} == "original" ]]
  then
    ifconfig wlo1 down
    macchanger -m ${ORG_MAC} wlo1
    ifconfig wlo1 up
  elif [[ ${ANSEWR} == "new" ]]
  then
    ifconfig wlo1 down
    macchanger -m ${NEW_MAC} wlo1
    ifconfig wlo1 up
  else
    exit 1
  fi
    
else
  echo "Execute the file with root user or sudo."
fi
  
