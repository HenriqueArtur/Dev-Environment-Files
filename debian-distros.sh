#!/bin/bash

# SYSTEM
echo "=> ⏳ Configuring general system behavior"
echo "--> 🔄 Change between workspace apps"
gsettings set org.gnome.shell.app-switcher current-workspace-only true
echo "> 🔧 Finished configs general systme, behavior"

echo ""
echo "--------------------"
echo ""

# SPOTIFY
echo "=> ⏳ Installing [SPOTIFY (flatpak)]..."
flatpak install flathub com.spotify.Client
echo "> 🎵 [SPOTIFY (flatpak)] instaled."
