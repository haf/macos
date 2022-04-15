#!/usr/bin/env bash

export _CLT_PATH="/Library/Developer/CommandLineTools"

# Update the OS
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running update of macOS: ./scripts/xcode_cli_tools.sh"
echo "    (restart if needed and run again): ./scripts/xcode_cli_tools.sh"
echo
sudo softwareupdate -ia --verbose

# Attempt to accept the Xcode license agreement
echo
echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Attempting to accept the agreement for Xcode:"
echo    "./scripts/xcode_cli_tools.sh"
echo
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
if ! sudo xcodebuild -license accept; then
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m You will need install the latest Xcode version"
  echo "before running this script. Install BOTH of these and and then you can re-run this script."
  echo "Lauching App Store now where you can download the latest version and install it."
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Once installation of Xcode is complete please re-run this setup."
  open "https://appstore.com/mac/apple/xcode"
  exit
fi

# Install Xcode CLI tools
if ! $(xcode-select -p &>/dev/null); then
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\033[0m Running install of Xcode CLI tools:"
  echo    "./scripts/xcode_cli_tools.sh"
  echo
  sudo xcode-select --install
  # Wait until the Xcode CLI tools are done installing
  until $(xcode-select -p &>/dev/null); do
    sleep 5
  done
  # Setup the Xcode CLI tools path
  #sudo xcode-select --switch $_CLT_PATH
  sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
fi

# Check that the Xcode CLI tools path is set
if [ ! -d "$(xcode-select -print-path)" ]; then
  echo
  echo -e "\033[1mBOOTSTRAP_MACOS:\003[0m Something went wrong trying to set the Xcode CLI tools path"
  echo
  exit 1
fi

# Install additional required components
/Applications/Xcode.app/Contents/MacOS/Xcode -installComponents
for pkg in /Applications/Xcode.app/Contents/Resources/Packages/*.pkg; do
  sudo installer -pkg "$pkg" -target /
done
