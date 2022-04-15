#!/usr/bin/env bash

declare -a packages=(
	"1password"
	"1password-cli"
	"authy"
	"charles"
	"chromium"
	"daisydisk"
	"discord"
	"docker"
	"figma"
	"firefox"
	"google-cloud-sdk"
	"gpg-suite"
	"iterm2"
	"kite"
	"little-snitch"
	"loom"
	"macdown"
	"mailmate"
	"miro"
	"openjdk"
	"pgadmin4"
	"rectangle"
	"resilio-sync"
	"signal"
	"sketch"
	"slack"
	"spotify"
	"steam"
	"telegram"
	"tor-browser"
	"visual-studio-code"
	"vlc"
	"whatsapp"
	"zoom"
)

softwareupdate --install-rosetta  --agree-to-license

for i in "${packages[@]}"
do
   brew install --cask "$i"
done

# 1Password in Firefox
echo
echo "You will need to 1Password Classic extension"
echo "See https://support.1password.com/cs/1password-classic-extension/"
echo
echo "I also recommend turning on settings sync in Firefox."
echo


# Configure iTerm2 with https://iterm2.com/documentation-dynamic-profiles.html
/Applications/iTerm.app/Contents/MacOS/iTerm2 &
sleep 5
killall iTerm2
cp ./files/haf.iterm2-profile.json $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/