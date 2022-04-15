#!/usr/bin/env bash

# With help from:
#     - http://mths.be/macos
#     - https://github.com/joeyhoer/starter
# Close open System Preferences to prevent from overriding these settings
osascript -e 'tell application "System Preferences" to quit'

defaults write -g ApplePressAndHoldEnabled -bool false

###############################################################################
# Computer Name                                                              #
###############################################################################
COMPUTER_NAME=$(scutil --get ComputerName)
echo -e -n "Change this machine name (currently: \"$COMPUTER_NAME\")? [y,N]: "
read -p "" -n 1 YESNO
case $YESNO in
[Yy]* )
  echo ""; echo -e -n "Enter the name of the machine (use [A-Z,a-z,0-9,_,-]): "
  read -p "" COMPUTER_NAME
  case $COMPUTER_NAME in
    "" )
      echo "You did not enter a machine name. Exiting"
  exit
    ;;
    [a-zA-Z0-9-_]* )
  # Set computer name (as done via System Preferences → Sharing)
  echo "Setting computer name to: \"$COMPUTER_NAME\""
  sudo scutil --set ComputerName "$COMPUTER_NAME"
  sudo scutil --set HostName "$COMPUTER_NAME"
  sudo scutil --set LocalHostName "$COMPUTER_NAME"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"
    ;;
    * )
  echo "\"$COMPUTER_NAME\""
      echo "Please use a machine name with the following characters: A-Z, a-z, 0-9, _, -"
    ;;
  esac
;;
[Nn]* )
  echo
  echo "Leaving machine name as: \"$COMPUTER_NAME\""
;;
* )
;;
esac
