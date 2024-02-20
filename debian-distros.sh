#!/bin/bash

# SYSTEM
echo "=> ⏳ Configuring general system behavior"
echo "--> ⬇ Update System"
sudo apt update
sudo apt upgrade -y
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

echo ""
echo "--------------------"
echo ""

# ZSH
echo "=> ⏳ Installing [ZSH]..."
sudo apt install zsh -y
sudo chsh -s $(which zsh)
cp .zshrc ~/.zshrc
echo "> 👾 [ZSH] instaled."

