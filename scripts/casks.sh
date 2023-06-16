#!/usr/bin/env bash

# 1password, 1password-cli install v8 which is unusable

declare -a packages=(
	"authy"
	"charles"
	"chromium"
	"daisydisk"
	"discord"
	"docker"
	"figma"
	"flac"
	"notion"
	"firefox"
	"ffmpeg"
	"google-cloud-sdk"
	"gpg-suite"
	"iterm2"
	"little-snitch"
	"loom"
	"macdown"
	"mailmate"
	"miro"
	"pgadmin4"
	"portaudio"
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
echo "Use Import Profile in the UI from ./config/haf-iterm2.json"


# Configure Rectangle
/Applications/Rectangle.app/Contents/MacOS/Rectangle &
sleep 5
killall Rectangle
echo "Use ./config/RectangleConfig.json in the UI"


# Configure VSCode
code --sync on
