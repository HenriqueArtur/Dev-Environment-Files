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
echo "> 👾 [ZSH] instaled."

echo ""
echo "--------------------"
echo ""

# Powerlevel10k
echo "=> ⏳ Installing [Powerlevel10k]..."
echo "--> Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "--> Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
echo "--> Copy Oh My Zsh configs..."
cp .zshrc ~/.zshrc
echo "--> Installing p10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "--> Copy p10k configs for root..."
cp .p10k.zsh ~/.p10k.zsh
echo "> 🖌 [Powerlevel10k] instaled."

