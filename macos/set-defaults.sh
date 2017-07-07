#!/bin/sh

# set reasonable macOS defaults
# inspired by : https://github.com/mathiasbynens/dotfiles
# more can be found here : https://gist.github.com/brandonb927/3195465


if [ "$(uname -s)" != "Darwin" ]; then
	exit 0
fi

set +e

echo "  › show the ~/Library folder"
chflags nohidden ~/Library

echo "  › don't automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo "  › increase the window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "  › disable smart quotes and smart dashes as they're annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo "  › disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "  › avoid the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "  › disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "  › set dark interface style"
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

echo ""
echo "› Finder: "
echo "  › show path bar"
defaults write com.apple.finder ShowPathbar -bool true

echo "  › disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "› Photos:"
echo "  › disable it from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo "  › set up Safari for development"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo ""
echo "› Dock"
echo "  › speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo "  › don't animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo ""
echo "› Transmission:"
echo "  › Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

echo "  › Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "  › Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

echo "  › Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

echo "  › Auto-add .torrent files in ~/Downloads"
defaults write org.m0k.transmission AutoImportDirectory -string "$HOME/Downloads"

echo "  › Auto-resize the window to fit transfers"
defaults write org.m0k.transmission AutoSize -bool true

echo "  › Set up the best block list"
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"


